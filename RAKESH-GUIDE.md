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

### 5. Install it (once)

In the folder, double-click **Setup (run once).bat**. A black window installs everything. When it says Done, press any key.

The four models are already set: one each from OpenAI (ChatGPT), Anthropic (Claude), Google (Gemini) and Perplexity. Perplexity searches the web, so it brings in current information.

## Start it each day

Double-click **Start Council.bat** in the folder. Two black windows open (leave them open), and the council opens in the browser after a few seconds. If the page is blank, wait five seconds and refresh.

To stop, close both black windows.

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

- **Page will not open:** close both black windows and double-click **Start Council.bat** again.
- **No answers, or an error about credits or payment:** your OpenRouter credit has run out. Add more at https://openrouter.ai/settings/credits
- **Error about the key or "unauthorized":** open the `.env` file in Notepad and check that the key is pasted correctly with no spaces. Create a new key if needed.
- **One model shows no answer:** that model may have been renamed or retired. Look up the current name at https://openrouter.ai/models and change it in `backend\\config.py` with Notepad, then start the council again.
- **Still stuck:** take a screenshot of both black windows and send it to DK.
