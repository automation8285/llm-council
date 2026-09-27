# LLM Council: guide for Rakesh (Windows)

## What it does

You type one question. Four AI models answer it, each one reviews and ranks the others' answers without knowing who wrote them, and a "Chairman" model writes one final best answer.

## One-time setup (about 30 minutes)

### 1. Install two free programs

1. **uv** (it runs the Python part and installs Python for you). Click Start, type `PowerShell`, open it, paste this line and press Enter:
   `powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"`
   Close PowerShell when it finishes.
2. **Node.js**. Go to https://nodejs.org, download the LTS version for Windows, run the installer and click Next until it finishes.

### 2. Download this project

1. On this GitHub page, click the green **Code** button, then **Download ZIP**.
2. Right-click the downloaded ZIP, choose **Extract All**, and extract it to `Documents`.
3. You now have a folder like `Documents\llm-council-master`. This is "the folder" in the steps below.

### 3. Get the OpenRouter key and add credit

OpenRouter is one account that gives access to OpenAI, Claude, Gemini and Perplexity models together.

1. Go to https://openrouter.ai and sign in (a Google account works).
2. Add credit: go to https://openrouter.ai/settings/credits and buy credits. 10 US dollars is plenty to start.
3. Create a key: go to https://openrouter.ai/settings/keys, click **Create Key**, give it a name, and copy the key. It starts with `sk-or-v1-`. Keep it private and never share it in chat or email.

### 4. Paste the key into the project

1. Open **Notepad**.
2. Type this one line, with your real key after the `=` sign:
   `OPENROUTER_API_KEY=sk-or-v1-your-key-here`
3. Click **File > Save As**. Go to the folder. Set **Save as type** to **All Files**. Name the file exactly `.env` and click Save.

### 5. Choose the four models

1. In the folder, open `backend`, right-click `config.py`, choose **Open with > Notepad**.
2. Replace the models part so it reads exactly like this, then save:

```
COUNCIL_MODELS = [
    "openai/gpt-5.4-mini",
    "anthropic/claude-sonnet-5",
    "google/gemini-3.8-flash",
    "perplexity/sonar",
]

CHAIRMAN_MODEL = "google/gemini-3.8-flash"
```

That gives one model each from OpenAI (ChatGPT), Anthropic (Claude), Google (Gemini) and Perplexity. Perplexity Sonar searches the web, so it brings in current information.

### 6. Install the project (once)

1. Open the folder in File Explorer. Click the address bar, type `powershell` and press Enter. A PowerShell window opens inside the folder.
2. Type `uv sync` and press Enter. Wait until it finishes.
3. Type `cd frontend` and press Enter, then `npm install` and press Enter. Wait until it finishes, then close the window.

## Start it each day

You need two PowerShell windows. Keep both open while you use it.

1. **Window 1:** open the folder, type `powershell` in the address bar, press Enter, then type:
   `uv run python -m backend.main`
2. **Window 2:** open the `frontend` folder inside the folder, type `powershell` in the address bar, press Enter, then type:
   `npm run dev`
3. Open Chrome or Edge and go to http://localhost:5173

To stop, close both PowerShell windows.

## Ask a question and read the answer

1. Click **+ New Conversation** on the left.
2. Type your question at the bottom and send it. Give it one to two minutes; four models are working.
3. The answer comes in three parts:
   - **Stage 1: Individual Responses**: each model's own answer, one tab each.
   - **Stage 2: Peer Rankings**: how the models ranked each other.
   - **Stage 3: Final Council Answer**: this is the one to read. It is the combined best answer.

Past conversations stay in the list on the left.

## Rough cost

About 8 to 12 US cents per question (about 7 to 11 rupees) with the four models above. Long questions or long answers cost more. You can see what you have spent at https://openrouter.ai/activity

## If it stops working

- **Page will not open:** check that both PowerShell windows are still open and running. If not, start them again.
- **"running scripts is disabled" in Window 2:** type `npm.cmd run dev` instead of `npm run dev`.
- **No answers, or an error about credits or payment:** your OpenRouter credit has run out. Add more at https://openrouter.ai/settings/credits
- **Error about the key or "unauthorized":** open the `.env` file in Notepad and check that the key is pasted correctly with no spaces. Create a new key if needed.
- **One model shows no answer:** that model may have been renamed or retired. Look up the current name at https://openrouter.ai/models and change it in `config.py`, then restart both windows.
- **Still stuck:** take a screenshot of both PowerShell windows and send it to DK.
