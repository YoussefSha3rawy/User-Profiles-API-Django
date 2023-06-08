FROM python
RUN apt-get update
RUN touch /home/.bash_aliases
RUN echo "# PYTHON_ALIAS_ADDED" >> /home/.bash_aliases
RUN mkdir /server
WORKDIR /server
COPY . /server/
RUN cd /server && ls -a 
RUN pip install -r requirements.txt
CMD ["python", "/server/manage.py", "runserver", "0.0.0.0:8000"]
EXPOSE 8000