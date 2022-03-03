## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/samuel-adams/Week-13-Project-Repo/blob/main/Diagrams/Elk%20Stack%20Diagram.jpg

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YML and config file may be used to install only certain pieces of it, such as Filebeat.

https://github.com/samuel-adams/Week-13-Project-Repo/blob/main/Ansible/my-playbook.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic to the network.
- _TODO: What aspect of security do load balancers protect? 
	Availability
	Web Traffic
	Security

What is the advantage of a jump box?
	Automation
	Security 
	Segmentation
	Access Control

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- _TODO: What does Filebeat watch for?  
	Log files of events and forwards them for indexing
- _TODO: What does Metricbeat record? 
	Metrics and statistics

The configuration details of each machine may be found below.

| NAME                | FUNCTION        | IP ADDRESS              | OPERATING SYSTEM |
|---------------------|-----------------|-------------------------|------------------|
| redteam-provisioner | Gateway         | 10.0.0.4/20.185.64.51   | Linux            |
| redteam-Web-1       | DVWA Web Server | 10.0.0.5                | Linux            |
| redteam-Web-2       | DVWA Web Server | 10.0.0.6                | Linux            |
| redteam-Web-3       | DVWA Web Server | 10.0.0.7                | Linux            |
| elk-server          | ELK Server      | 10.1.0.4/40.118.134.183 | Linux            |
| Load Balancer       | Load Balancer   | 13.82.49.176            | Linux            |
| Workstation         | Access Control  | Public IP               | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Elk server machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses
	Workstation Public IP through TCP 5601

Machines within the network can only be accessed by workstation and redteam_provisioner.
- _TODO: Which machine did you allow to access your ELK VM? 
	redteam_provisioner
What was its IP address? 
	10.0.0.4 via ssh or tcp/22

A summary of the access policies in place can be found in the table below.

| NAME                | PUBLICLY ACCESSIBLE | ALLOWED IP ADDRESSES                 |
|---------------------|:-------------------:|--------------------------------------|
| redteam-provisioner |          No         | Workstation Public IP on SSH 22      |
| redteam-Web-1       |          No         | 10.0.0.4 on SSH 22                   |
| redteam-Web-2       |          No         | 10.0.0.4 on SSH 22                   |
| redteam-Web-3       |          No         | 10.0.0.4 on SSH 22                   |
| elk-server          |          No         | Workstation Public IP using TCP 5601 |
| Load Balancer       |          No         | Workstation Public IP on HTTP 80     |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?  
	you can quickly and easily deploy multitier apps so coding is not necessary for automation.  An Ansible 	playbook is created listed the steps necessary for deployment and Ansible will take care of the rest.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
	- Install docker
	- Install pip3
	- Install Docker Python
	- Increase system memory
	- download and start the Elk container specifying the ports that are published and enable docker 	
	  service on reboot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/samuel-adams/Week-13-Project-Repo/blob/main/Diagrams/docker%20ps%20results.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring
	redteam-web-1  10.0.0.5
	redteam-web-2  10.0.0.6
	redteam-web-3  10.0.0.7

We have installed the following Beats on these machines:  
	On elk-server, redteam-Web-1, redteam-Web-2 and redteam-Web-3, Filebeat and Metricbeat are installed.

	These Beats allow us to collect the following information from each machine:  Filebeat collects data about 	events that occur such as authentication events,  Metricbeat collects metrics and statistics about the system 	such as CPU and Memory usage.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the '/etc/ansible/files/filebeat-config.yml' file to '/etc/filebeat/filebeat-playbook.yml'.
- Update the  file to include the installer
- Run the playbook, and navigate to 'Kibana > Logs : Add log data > System logs > 5:Module Status 	> Check data' to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- Which file is the playbook? 
	Ansible playbook is 'my-playbook.yml'
	Filebeat playbook is 'filebeat-playbook.yml'
	Metricbeat playbook is 'metricbeat-playbook.yml'
- Where do you copy it?  
	'/etc/ansible/files'
- Which file do you update to make Ansible run the playbook on a specific machine? 		
	Add the webserver ip addresses to the [webservers] section of the /etc/ansible/hosts 		
	file as well as the ip address of the elk server to the [elk] section of the /etc/ansible/hosts file.  
- How do I specify which machine to install the ELK server on versus which to install Filebeat on?
	In the my-playbook.yml file, point to the [webservers] section of the /etc/ansible/hosts file.  These 	addresses are where filebeat will be installed.  Likewise, in the elkserver.yml file, point to the [elk] 	section of the /etc/ansible/hosts file.  This address is where the Elk server will be installed.
- _Which URL do you navigate to in order to check that the ELK server is running?
	http://[your.ELK-VM.External.IP]:5601/app/kibana 
				or 
	sysadmin@10.1.0.4: curl localhost:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
sudo apt-get update
sudo apt install docker.io
sudo service docker start
systemctl status docker
sudo docker pull cyberxsecurity/ansible
sudo docker run -ti cyberxsecurity/ansible bash
sudo docker start <image-name>
sudo docker ps -a
sudo docker attach <image-name>
ssh-keygen
ansible -m ping all

