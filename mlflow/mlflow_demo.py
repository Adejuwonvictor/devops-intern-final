import mlflow


def main() -> None:
    mlflow.set_experiment("devops-intern-demo")

    with mlflow.start_run(run_name="devops-run"):
        # Params
        mlflow.log_param("learning_rate", 0.01)
        mlflow.log_param("epochs", 5)
        mlflow.log_param("batch_size", 32)

        # Metrics
        for epoch in range(1, 6):
            loss = 1.0 / epoch
            acc = 1.0 - loss
            mlflow.log_metric("loss", loss, step=epoch)
            mlflow.log_metric("accuracy", acc, step=epoch)

        # Tag
        mlflow.set_tag("author", "DevOps Intern")
        mlflow.set_tag("project", "devops-intern-final")

        print("Logged a MLflow run.")


if __name__ == "__main__":
    main()
