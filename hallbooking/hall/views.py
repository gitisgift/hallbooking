from django.shortcuts import render

# Create your views here.

from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser

from .models import BookHallRequest,Hall , Booked
from .serializers import (HallSerializer , BookHallRequestSerializer ,
 BookedSerializer)
from rest_framework import generics , status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from datetime import datetime
from django.db import transaction , IntegrityError
from multiprocessing import Process



class HallList(generics.ListCreateAPIView):
	queryset = Hall.objects.all()
	serializer_class = HallSerializer


class HallDetail(generics.RetrieveUpdateDestroyAPIView):
	queryset = Hall.objects.all()
	serializer_class = HallSerializer

class ListScheduldeSeminar(generics.ListAPIView):
	model_class = Hall
	serializer_class = HallSerializer
	
	def get_queryset(self):
		from .models import BookHallRequest
		data=self.request.GET
		start_date=data.get('start_date',None)
		end_date = data.get('end_date',None)
		try:
			start_date_dt=datetime.strptime(start_date,"%d-%m-%Y").date()
			end_date_dt=datetime.strptime(end_date,"%d-%m-%Y").date()
		except:
			raise ValueError("Please provide date format in %d-%m-%Y")
		if start_date is not None and end_date is not None:
			halls = self.model_class.objects.all()
			#print(halls)
			all_req = BookHallRequest.objects.filter(is_alloted=True)
			
			available_hall=[]
			if len(all_req) > 0:
				for req in all_req:
					print(req.start_date.date())
					if req.start_date.date()>=start_date_dt and req.end_date.date()<=end_date_dt:
						bs=Booked.objects.select_related('hall').filter(hallrequest_id=req.id)
						for b in bs:
							if b.hall not in available_hall:
								available_hall.append(b.hall)

			return available_hall
		else:
			return []


#request , if booked already 
@api_view(['DELETE'])
def BookHallRequestDelete(request,pk):
	#model_class = BookHallRequest
	from .models import BookHallRequest

	if request.method== 'DELETE':
		try:
			b = BookHallRequest.objects.get(id =pk)
		except:
			return Response(status=status.HTTP_404_NOT_FOUND)
		bb=b.booked_request.all()
		if len(bb) > 0:
			for bk in bb:
				bk.delete()
		b.delete()
		return Response(status=status.HTTP_204_NO_CONTENT)






class BookHallRequest(generics.ListCreateAPIView):
	serializer_class = BookHallRequestSerializer
	model_class = BookHallRequest
	#renderer_classes = [JSONRenderer]
	def get_queryset(self):
		return self.model_class.objects.all()

	def perform_create(self, serializer):
		serializer.save()

	def create(self,request,*args,**kwargs):
		serializer = self.get_serializer(data=request.data)
		serializer.is_valid(raise_exception=True)
		start_date = serializer.validated_data.get('start_date',)
		capacity_needed = serializer.validated_data.get('total_capacity_needed',)
		hall_q=serializer.validated_data.get('hall_q',)
		# get all available hall
		print(start_date)
		all_booked_req=self.model_class.objects.filter(is_alloted=True,end_date__gte=start_date)
		print(all_booked_req)
		#print(Hall.objects.filter(is_active=True).order_by('capacity'))
		available_hall=[h.id for h in Hall.objects.filter(is_active=True).order_by('capacity') if h.capacity >= int(capacity_needed)]
		print(available_hall)
		if len(all_booked_req)!=0:
			for r in all_booked_req:
				bs=Booked.objects.select_related('hall').filter(hallrequest_id=r.id)
				for b in bs:
				#if b.hall.capacity >= capacity_needed:
					print(b.hall_id)
					if b.hall_id in available_hall:
						available_hall.remove(b.hall_id)

		flag=False
		if len(available_hall) > 0:
			flag=True
			serializer.validated_data.update({'suggested_hall':Hall.objects.get(id=available_hall[0])})

		self.perform_create(serializer)
		headers = self.get_success_headers(serializer.data)

		resp=serializer.data
		if flag:
			if hall_q < 2:
				resp.update({'available_hall':available_hall[0]})
			else:
				resp.update({'available_hall':available_hall})
		else:
			resp.update({'available_hall':None})
		
		return Response(resp, status=status.HTTP_201_CREATED, headers=headers)




@transaction.atomic
def save_to_db(data):
	serializer = BookedSerializer(data=data,many=True)
	if serializer.is_valid():
		d=serializer.save()
		#return Response(serializer.data, status=status.HTTP_201_CREATED)
	#return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def accept_hall(request):
	from .models import BookHallRequest
	data=request.data
	hallrequest=data.get('hallrequest',None)
	halls = data.get('hall',None)
	a=[]
	for hall in halls:
		a.append({'hall':int(hall),'hallrequest':int(hallrequest)})
		#d={'hall':int(hall),'hallrequest':int(hallrequest)}
	p = Process(target=save_to_db, args=(a,))
	p.start()
	p.join()
	
	return Response("will update", status=status.HTTP_201_CREATED)
		#print(a)
		# if hallrequest is not None:
		# 	try:
		# 		hq = BookHallRequest.objects.get(id=hallrequest)
		# 		if hq.suggested_hall_id!=hall:
		# 			return Response({'error':'hall not offered to you'}, status=status.HTTP_400_BAD_REQUEST)
		# 	except BookHallRequest.DoesNotExist:
		# 		return Response({'error':True}, status=status.HTTP_400_BAD_REQUEST)
		






				






