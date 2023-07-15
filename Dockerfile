#Deriving the latest base image
FROM python:latest

#Labels as key value pair
LABEL Maintainer="Kaushal_Baghel"

#Installing required packages
RUN pip install numpy
RUN pip install pandas
RUN pip install ydata-profiling

# Working directory
WORKDIR /usr/app/src

#to COPY the remote file at working directory in container
COPY gen_report.py ./
# Now the structure looks like this '/usr/app/src/gen_report.py'

COPY Test.csv ./

#CMD instruction should be used to run the software
#contained by your image, along with any arguments.
CMD [ "python", "./gen_report.py"]
