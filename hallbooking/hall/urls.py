from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from . import views


urlpatterns = [
    path('hall/', views.HallList.as_view()),
    path('hall/<int:pk>/', views.HallDetail.as_view()),
    path('hall_request/',views.BookHallRequest.as_view()),
    path('accept_hall/',views.accept_hall,name='accept_hall'),
    path('schedulde_hall/',views.ListScheduldeSeminar.as_view()),
    path('hall_request/<int:pk>/delete/',views.BookHallRequestDelete)
]

urlpatterns = format_suffix_patterns(urlpatterns)