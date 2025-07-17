# ── Base image bundles HTCondor daemons ───────────────────────
FROM htcondor/mini

# ── Install Voilà, widgets, and register the kernel ───────────
RUN pip install ipywidgets voila ipykernel jupyter-client jupyter-core && \
    python3 -m ipykernel install --sys-prefix --name python3 --display-name python3

# ── Work in the notebook directory ────────────────────────────
WORKDIR /home/htcondor/notebook

# ── On container start, launch Condor & Voilà ─────────────────
ENTRYPOINT ["bash","-lc","condor_master & sleep 5 && cd /home/htcondor/notebook && \
voila notebook.ipynb --port=8866 --no-browser --Voila.ip=0.0.0.0 --show_tracebacks=True"]
