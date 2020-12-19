from django.db import models

# Create your models here.

from django.utils import timezone
from django.contrib.auth.models import User

class Hall(models.Model):
	name = models.CharField(max_length=200)
	capacity = models.IntegerField()
	is_active = models.BooleanField(default=True)



class BookHallRequest(models.Model):
	booked_by = models.ForeignKey(User,on_delete=models.CASCADE)
	total_capacity_needed = models.CharField(max_length=20,null=False)
	start_date = models.DateTimeField(default= timezone.now,
		help_text='please use date time format %d-%m-%Y %I:%M %p')
	end_date = models.DateTimeField(null=False,
		help_text='please use date time format like %d-%m-%Y %I:%M %p')
	suggested_hall = models.ForeignKey(Hall,null=True,on_delete=models.CASCADE)
	request_confirmed_by_user = models.BooleanField(default=False)
	is_alloted = models.BooleanField(default=False)
	hall_q= models.IntegerField(default=1)

	class Meta:
		ordering=('id',)



class Booked(models.Model):
	hall = models.ForeignKey(Hall,on_delete=models.CASCADE,related_name='hall_booked')
	hallrequest = models.ForeignKey(BookHallRequest,on_delete=models.CASCADE,
		related_name = 'booked_request')


	








