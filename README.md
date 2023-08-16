# statefull-k8s
Deploying WordPress and MySQL with Persistent Volumes


## how WordPress connects to the MySQL database in a Kubernetes setup 


When you deploy WordPress and MySQL using Kubernetes, they are hosted in separate pods, possibly on different nodes in the cluster. To make WordPress interact with the MySQL database, you need to ensure that WordPress can access the MySQL database server. Here's how it works:

### Environment Variables: 

In the WordPress deployment YAML, you specify environment variables that provide connection information to the MySQL database. These environment variables include:

### WORDPRESS_DB_HOST: 

This is the hostname of the MySQL database server. In Kubernetes, you use the name of the MySQL service you created (e.g., mysql-service).

### WORDPRESS_DB_USER: 

The MySQL username that WordPress will use to connect to the database.

### WORDPRESS_DB_PASSWORD: 

This is usually stored in a Kubernetes secret and passed to the WordPress container securely. It's the password for the MySQL user.

### WORDPRESS_DB_NAME: 

The name of the MySQL database that WordPress should use.

### Service Discovery: 

Kubernetes provides service discovery. When WordPress containers in the pod want to connect to the MySQL database, they use the service name (mysql-service) as the hostname. Kubernetes automatically resolves this to the appropriate IP address of the MySQL service.

### Networking: 

Kubernetes sets up networking in such a way that pods can communicate with each other, even if they are on different nodes. This is essential for WordPress to reach the MySQL database pod.

### Persistent Volume Claims: 

The data stored by MySQL and WordPress needs to be persistent. This is achieved through Persistent Volume Claims (PVCs). PVCs are bound to Persistent Volumes (PVs), which are external storage resources. This ensures that even if a pod is rescheduled or replaced, the data remains intact.

### Secrets: 

Sensitive information like passwords is stored in Kubernetes secrets. WordPress accesses the password via the environment variables, which are populated from these secrets.

To summarize, when you deploy WordPress and MySQL in Kubernetes pods, WordPress uses the environment variables provided in its deployment configuration to connect to the MySQL database. The service name (mysql-service) is used to reach the MySQL database. The Kubernetes networking layer handles the routing of requests between pods, even if they are on different nodes. The data is stored in Persistent Volumes to maintain persistence.

Remember that this is a high-level overview. Kubernetes configurations, networking, and services can get quite complex depending on the setup and requirements. Always ensure you follow best practices for security and data management in your Kubernetes environment.
