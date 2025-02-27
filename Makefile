include .env

celery-init:
	docker compose up airflow-init

celery-up:
	docker compose up -d

celery-down:
	docker compose down

