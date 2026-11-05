# Google AI console — English adaptation

An English adaptation of [worldonlyu/Google_AI_Pro_2Year_ZeroCost_Auto](https://github.com/worldonlyu/Google_AI_Pro_2Year_ZeroCost_Auto), with phone-approval waiting and fixes to startup and logging. The upstream repository does not specify a license; obtain appropriate permission before redistributing this adaptation.

## Windows setup

Install Python 3.10 or newer and Google Chrome. Run `Start-Console.bat` and open http://127.0.0.1:18765. Leave the command window open. A first run installs dependencies from PyPI.

The program stores account passwords, two-factor secrets and payment-card details in plaintext in `config.json`, and browser profiles and screenshots locally. These files are excluded from Git. Do not commit or share them. Deleting them removes local saved data; it does not change your Google account or subscription.

Phone approval waits up to five minutes. Offers, eligibility, checkout prices and cancellation are controlled by Google; check them yourself. The original author’s claims of free service are not guaranteed.

## Setup reported by the maintainer

The maintainer was already signed into the Google account on a phone and approved the sign-in prompt there. They used Surfshark connected to Seattle while on an eduroam network, and a Revolut virtual card that had already been used once on another account. This is one reported experience; eligibility, verification and payment outcomes can differ.

## What it took to get this working

Our first attempt got stuck reporting that the batch queue was already running. A Windows console encoding issue could leave the queue marked as running after a logging failure; the queue now clears its flag when startup fails. We also encountered a port conflict from an older hidden server, so the launcher uses port 18765. Finally, the original sign-in flow switched away from the Google phone prompt too quickly. This version waits up to five minutes for phone approval and stops if sign-in remains incomplete. These fixes helped our attempt; other setups can fail for different reasons.

Google also temporarily limited sign-in after too many attempts on the same account. In our case, waiting about 10 minutes before trying again helped. The required wait can vary.
