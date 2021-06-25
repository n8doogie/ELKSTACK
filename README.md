# ELKSTACK
A Repo containing Ansible YAML files, bash scripts, screen caps, and diagrams of my azure virtual network.


## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/n8doogie/ELKSTACK/blob/main/3.%20Diagram%20%26%20Screencaps/ELK%20Diagram.jpg

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat or MetricBeat.

https://github.com/n8doogie/ELKSTACK/blob/main/2.%20Ansible%20Files/install-elk.yml

https://github.com/n8doogie/ELKSTACK/blob/main/2.%20Ansible%20Files/filebeat-playbook.yml

https://github.com/n8doogie/ELKSTACK/blob/main/2.%20Ansible%20Files/metricbeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly secure and redundant, in addition to restricting access to the network.

- Load balancers provide additional security for the network by adding redundancy & helping to negate denial of service attacks. 
- They do this by evenly distrubuting network traffic between linked systems.
- The advantage of using a jump box is that it acts as an added layer of security for the user. Think of it as a VPN of sorts.
- It allows users to put a buffer between their home system and the system they're trying to access.  

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log and system data.
- FileBeat records specified log files within a system while MetricBeat records metrics and stats within a system or server.
- Use FileBeat to monitor any changes to specified system logs.
- Use MetricBeat to monitor any suspicious system usage on a machine or server.

The configuration details of each machine may be found below.

| Name        | Function            | IP Address | Operating System |
|-------------|---------------------|------------|------------------|
| Jump Box    | Gateway             | 10.0.0.4   | Linux (Ubuntu)   |
| WEB-1       | Ansible Node (DVWA) | 10.0.0.5   | Linux (Ubuntu)   |
| WEB-2       | Ansible Node (DVWA) | 10.0.0.6   | Linux (Ubuntu)   |
| WEB-3       | Ansible Node (DVWA) | 10.0.0.8   | Linux (Ubuntu)   |
| ELKStack-VM | Ansible Node (ELK)  | 10.2.0.4   | Linux (Ubuntu)   |

### Access Policies

The machines on the internal network are not exposed to the public Internet.

Only the Jump Box machine can accept connections from the Internet. 
Access to this machine is only allowed from the following IP address:
- PRIVATE HOME SYSTEM IP ADDRESS

Machines within the network can only be accessed by The Jump Box (through an ansible container).
- The Jump Box VM is able to access the ELK VM VIA ssh'ing in through an ansible container. 
- The IP for the Jump Box VM is: 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name        | Publicly Accessible | Allowed IP Addresses                          |
|-------------|---------------------|-----------------------------------------------|
| Jump Box    | No                  | HOME SYSTEM IP ADDRESS                        |
| ELKStack-Vm | No                  | 10.0.0.4                                      |
| Web-1       | No                  | 10.0.0.4                                      |
| Web-2       | No                  | 10.0.0.4                                      |
| Web-3       | No                  | 10.0.0.4                                      |

### Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because: 
- It allows the user the ability to quicky reset their environment in the event of compromise.
- It allows the user the ability to have consistent set ups in the event that a reset is required.

The playbook implements the following tasks:
- Installs Docker.io 
- Installs Python3-pip
- Installs the Docker module via PiP3
- Increases the systems virtual memory so that the ELK container will be able to run.
- Launches the ELK container on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/n8doogie/ELKSTACK/blob/main/3.%20Diagram%20%26%20Screencaps/Docker%20ps%20Screencap.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

- VM-1 (Web-1) - 10.0.0.5
- VM-2 (Web-2) - 10.0.0.6
- VM-3 (Web-3) - 10.0.0.8

We have installed the following Beats on these machines:
- FileBeat
- MetricBeat

These Beats allow us to collect the following information from each machine:
- FileBeat allows for the collection and analysis of Log Data within selected regions of the virtual machines. It can provide users with the ability to monitor changes to log files. (Syslog events by hostname [Filebeat System] ECS)
- MetricBeat allows for the collection and analysis of metric data and stats (such as RAM or CPU usage) generated by the OS within the virtual machine. It can provide users with the ability to monitor what system services are doing what in relation to the virtual machines. (CPU usage [Metricbeat Docker] ECS)

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:

- Copy the 'ansible.cfg' file (https://github.com/n8doogie/ELKSTACK/blob/main/2.%20Ansible%20Files/ansible.cfg) into the '/etc/ansible' directory.
- $nano the 'hosts' file within the '/etc/ansible' directory to include the machines you wish to use.
- when inside the text editor for the 'hosts' file, under the section '# Ex 2: A collection of hosts belonging to the 'webservers' group', add:

[webservers]

10.0.0.5 ansible_python_interpreter=/usr/bin/python3

10.0.0.6 ansible_python_interpreter=/usr/bin/python3

10.0.0.8 ansible_python_interpreter=/usr/bin/python3

[elk]

10.2.0.4 ansible_python_interpreter=/usr/bin/python3

- Copy the 'install-elk.yml'(https://github.com/n8doogie/ELKSTACK/blob/main/2.%20Ansible%20Files/install-elk.yml) file to the '/etc/ansible' directory.
- Copy the 'filebeat-playbook.yml' (https://github.com/n8doogie/ELKSTACK/blob/main/2.%20Ansible%20Files/filebeat-playbook.yml) file to the '/etc/ansbile' directory.
- Copy the 'metricbeat-playbook.yml' (https://github.com/n8doogie/ELKSTACK/blob/main/2.%20Ansible%20Files/metricbeat-playbook.yml) file to the '/etc/ansible' directory.
- Copy the 'filebeat-config.yml' (https://github.com/n8doogie/ELKSTACK/blob/main/2.%20Ansible%20Files/filebeat-config.yml) file to the '/etc/ansible' directory.
- Copy the 'metricbeat-config.yml' (https://github.com/n8doogie/ELKSTACK/blob/main/2.%20Ansible%20Files/metricbeat-config.yml) file to the '/etc/ansible' directory.
- Run the playbooks, and navigate to http://52.154.44.121:5601/app/kibana check that the installation worked as expected.

Voila! 
