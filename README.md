# Django demo

A Django project that includes user authentication using forms, product management with Django Rest Framework (DRF), and background email functionality with Celery. The project is containerized using Docker and uses Redis as a message broker for asynchronous tasks.

## Table of Contents

- [Getting Started](#getting-started)
- [Setup and Configuration](#setup-and-configuration)
- [Features](#features)
- [Usage](#usage)

---

## Getting Started

These instructions will get the project up and running on your local machine using Docker.

### Prerequisites

- **Docker** and **Docker Compose** installed.

## Setup and Configuration

1. **Clone the Repository**
   ```bash
   git clone https://github.com/dansclearov/django-demo.git
   cd django-demo
   ```

2. **Environment Variables**

   Create a `.env` file at the project root with the following content:

   ```dotenv
   DJANGO_DATABASE_URL=mydatabase
   ```

3. **Docker Setup**

   Start the project using Docker Compose:

   ```bash
   docker-compose up
   ```

   This will:
   - Set up Django and PostgreSQL.
   - Start Redis for Celery.
   - Initialize Celery for background tasks.

6. **Access the Application**

   - The Django app runs on `http://localhost:8000`.

## Features

1. **User Authentication with Django Forms**
   - Users can register, log in, and log out using Django’s form-based views for authentication.
   - Profile page for each user.
   - Only authenticated users can create or modify products.

2. **Product Management (CRUD) with Django Rest Framework (DRF)**
   - DRF is used to create API endpoints for managing products.
   - Users can perform CRUD operations on products.
   - Product model includes `name`, `description`, and `price` fields.

3. **Background Email Task with Celery**
   - A welcome email is sent asynchronously when a new user registers.
   - Emails are printed to the console for easy local testing (instead of actually sending).

## Usage

1. **Register a New User**
   - Visit `http://localhost:8000/register/` to create a new account.

2. **Log in and Access the Profile**
   - After logging in, go to your profile page to manage your account.

3. **Manage Products via API**
   - Use API endpoints (e.g., `http://localhost:8000/products/`) for CRUD operations on products.
   - Use tools like Postman or curl to interact with the API. An exported Postman collection is included in the repository.

4. **Test Email Functionality**
   - Register a new user to see a welcome email printed to the console.

---

### Additional Notes

- **Email Testing**: Emails are printed to the console using Django’s console email backend for simple local testing.
- **API Endpoints**: The product management API uses DRF, while user authentication relies on Django forms.
- **Celery Commands**: To monitor Celery, you can view logs in the Docker terminal. Celery tasks will be processed by the `celery_worker` service.
