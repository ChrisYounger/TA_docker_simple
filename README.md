# Background
This TA will collect metrics from the docker host using commands such as `docker stats` and `docker ps`.  
It is called "docker simple" because it is suited for small, simple docker environments. 
I created this app becuase I needed to monitor my home docker environment and I couldn't figure out how to do it in a simple manner.
The app is a fork of this: https://github.com/splunk/docker-itmonitoring/tree/master/ta-dockerstats

If you have docker swarms, use kubernetes or have anything remotely complex then you should instead consider using a different solution, such as:
* Outcold add-on here: https://splunkbase.splunk.com/app/3723/  (Note: this is a paid app)
* CollectD to a HTTP Event Collector input  (More info in Marc's 2017 .conf talk at bottom of this page)
* Other things...



# Contents and requirements
This app contains a couple of shell scripts for data collection, some inputs that are disabled by default, some parsing properties and some search-time field extractions. 
This app does not require python.
The shell scripts call **docker** commands and by default these are restricted to root. As such you will need to run the UF as root or come up with your own creative solution (such as using cron and redirecting to a file, or see note below about running in a container).
This TA does not require changing the default container logging agent and reads the JSON logs directly. There is a disabled input to read the default docker logs from the default location of `/var/lib/docker/containers/*/*json.log`. 


# Installation
Typically you would run this TA on a universal forwarder, probably via a deployment server. In any case, like most other TA's you should do this:
1. Create an index to receive your data
2. Install this TA onto your Search Head(s), 
3. Install this TA and onto your Indexer/s or heavy forwarder/s (That is, if your data goes through a heavy forwarder)
4. Create a local/ folder in this TA
5. Copy default/inputs.conf.example to local/
6. Rename it to "inputs.conf"
7. Edit the file and set:
   - Which inputs will not be disabled
   - The index to send the data to
   - Your desired polling rate
8. Save the TA (if necessary deploy it) and restart the UF.
9. Optionally get and install the pre-canned dashboards in the "Docker Simple" app: https://splunkbase.splunk.com/app/XXXX/


# Collecting metrics from within a container
It is possible to collect metrics from within a docker container if you mount the docker socket like so: ` -v /var/run/docker.sock:/var/run/docker.sock` and also install the docker CLI tools into the container. 


# Thanks 
Thank you to Marc Chéné who did most of the original work on which this TA is based. 
Go watch his conf talk here: https://conf.splunk.com/conf-online.html?search=IT123634#/

