# DevOps Intern Final Assessment

**Name:** Victor Adejuwon

**Date:** 2026-08-05

**Project:** DevOps pipeline using Linux, GitHub, Docker, CI/CD, Nomad, and Grafana Loki.

---

## Project Description

This repository demonstrates a DevOps workflow, covering:

1. **Git & GitHub** — version control + remote repo.
2. **Linux & Scripting** — shell automation.
3. **Docker** — containerizing a Python app.
4. **CI/CD** — GitHub Actions running the app on every push.
5. **Nomad** — declarative job deployment of the Docker container.
6. **Monitoring** — Grafana Loki collecting container logs.
7. **MLflow tracking**


---

## Repository Structure

```
devops-intern-final/
├── README.md
├── hello.py                       # Sample Python app
├── Dockerfile                     # Containerizes hello.py
├── scripts/
│   └── sysinfo.sh                 # Linux system info script
├── .github/
│   └── workflows/
│       └── ci.yml                 # GitHub Actions CI pipeline
├── nomad/
│   └── hello.nomad                # Nomad service job
├── monitoring/
│   └── loki_setup.txt             # Loki setup & log query notes
└── mlflow/                        # MLflow tracking demo
    └── mlflow_demo.py
```

---

## 1. Git & GitHub Setup

```bash
git init
git add .
git commit -m "Initial commit: DevOps intern final project"
gh repo create devops-intern-final --public --source=. --remote=origin --push
```


---

## 2. Linux & Scripting

Run the script locally:

```bash
chmod +x scripts/sysinfo.sh
./scripts/sysinfo.sh
```

Expected output: `whoami`, `date`, and a `df -h` table.

---

## 3. Docker

Build the image:

```bash
docker build -t devops-hello .
```

Run the container:

```bash
docker run --rm devops-hello
```

Expected stdout:

```
Hello, DevOps!
```

---

## 4. CI/CD with GitHub Actions

The workflow at `.github/workflows/ci.yml` runs automatically on every push to `main` (and on pull requests). It checks out the code, sets up Python, and runs `python hello.py`.

**Status Badge** (replace `<your-username>` with your GitHub handle):

```markdown
![CI](https://github.com/Adejuwonvictor/devops-intern-final/actions/workflows/ci.yml/badge.svg)
```

---

## 5. Nomad Deployment

A Nomad client + Docker plugin are required on the host. Then:

```bash
nomad job run nomad/hello.nomad
nomad job status hello
nomad alloc logs <alloc-id>
```

Stop the job:

```bash
nomad job stop hello
```

---

## 6. Monitoring with Grafana Loki

See [`monitoring/loki_setup.txt`](monitoring/loki_setup.txt) for the full setup.

Quick start (Docker):

```bash
docker run -d --name loki -p 3100:3100 \
  -v $(pwd)/monitoring/loki-config.yaml:/etc/loki/local-config.yaml \
  grafana/loki:2.9.0 -config.file=/etc/loki/local-config.yaml
```

Query logs:

```bash
curl -G -s "http://localhost:3100/loki/api/v1/query" \
  --data-urlencode 'query={job="hello"}'
```

---

## 7.  MLflow

```bash
pip install mlflow
python mlflow/mlflow_demo.py
mlflow ui --port 5000
```

Then open <http://localhost:5000>.

---

## Tools Used

- Linux (bash)
- Git & GitHub
- Docker
- GitHub Actions
- HashiCorp Nomad
- Grafana Loki
- MLflow

---

**Author:** Victor Adejuwon · **Date:** 2026-08-05
