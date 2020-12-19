from rest_framework import serializers
from .models import Hall,BookHallRequest,Booked
from django.db import transaction , IntegrityError
from django.db.models import Q

class HallSerializer(serializers.ModelSerializer):
	class Meta:
		model = Hall
		fields = ('name','capacity',)



class BookHallRequestSerializer(serializers.ModelSerializer):
	start_date = serializers.DateTimeField(input_formats=(['%d-%m-%Y %I:%M %p']))
	end_date = serializers.DateTimeField(input_formats=(['%d-%m-%Y %I:%M %p']))

	class Meta:
		model = BookHallRequest
		fields =('id','booked_by','total_capacity_needed','start_date','end_date','hall_q')



def is_already_booked(hallrequest,hall):
	all_req = BookHallRequest.objects.filter(is_alloted=True)
	r = BookHallRequest.objects.get(id=hallrequest)

	available_hall=[]
	flag=False
	if len(all_req) > 0:
		for req in all_req:
			if flag:
				break
			if req.id == r.id:
				continue
			if req.end_date >= r.start_date :
				#print("fffff")
				bs=Booked.objects.select_related('hall').filter(hallrequest_id=req.id)
				for b in bs:
					print("ffgfgffhhf",b.hall.id)
					if b.hall.id == hall:
						flag=True
						break
	return flag



class BookedSerializer(serializers.ModelSerializer):
	class Meta:
		model = Booked
		fields =('hall','hallrequest')

	@transaction.atomic
	def create(self, validated_data):
		try:
			with transaction.atomic():
				print('validated',validated_data)
				hallrequest=validated_data.get('hallrequest',None)
				hall= validated_data.get('hall',None)
				is_booked=is_already_booked(hallrequest.id,hall.id)
				print(is_booked)
				booked=Booked.objects.create(**validated_data)
				if hallrequest is not None:
					b=BookHallRequest.objects.get(id=hallrequest.id)
					b.is_alloted=True
					b.save()
				if is_booked:
					raise ValueError("can't booked")
					return None
				
				return booked
		except :
			raise ValueError("can't booked")
			return None
		
