INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T21:29:29','“Cytokine Storm” Debunked: Machine Learning Exposes Killer of Covid-19 Patients','https://scitechdaily.com/cytokine-storm-debunked-machine-learning-exposes-the-true-killer-of-covid-19-patients/','11 points','https://news.ycombinator.com/item?id=35855782','32 minutes ago','amichail','https://news.ycombinator.com/user?id=amichail')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T09:48:06','''He epitomised the dazzling 60s and then was gone'': Rolling Stone Brian Jones','https://www.theguardian.com/music/2023/may/07/nick-broomfield-brian-jones-rolling-stones-arena-documentary-interview','4 points','https://news.ycombinator.com/item?id=35849691','2 hours ago','zeristor','https://news.ycombinator.com/user?id=zeristor')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T07:40:52','''Too greedy'': mass walkout at global science journal over ''unethical'' fees','https://www.theguardian.com/science/2023/may/07/too-greedy-mass-walkout-at-global-science-journal-over-unethical-fees','428 points','https://news.ycombinator.com/item?id=35848894','11 hours ago','mindracer','https://news.ycombinator.com/user?id=mindracer')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T19:36:38','210k works in the Public Domain, searchable','https://digital.staatsbibliothek-berlin.de/','63 points','https://news.ycombinator.com/item?id=35854834','8 hours ago','doener','https://news.ycombinator.com/user?id=doener')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T04:21:48','5G Rollout Disappointments','https://spectrum.ieee.org/5g-rollout-disappointments','66 points','https://news.ycombinator.com/item?id=35847899','13 hours ago','mfiguiere','https://news.ycombinator.com/user?id=mfiguiere')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T08:15:33','A Go compiler, written in Rust (2016)','https://github.com/yberreby/rgo','70 points','https://news.ycombinator.com/item?id=35849092','9 hours ago','philonoist','https://news.ycombinator.com/user?id=philonoist')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T21:55:26','A Group Is Its Own Worst Enemy [pdf] (2005)','https://gwern.net/doc/technology/2005-shirky-agroupisitsownworstenemy.pdf','37 points','https://news.ycombinator.com/item?id=35855988','7 hours ago','mooreds','https://news.ycombinator.com/user?id=mooreds')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T15:20:22','AI voice scams: 77% of victims lose money','https://9to5mac.com/2023/05/05/ai-voice-scams-how-to-prevent/','46 points','https://news.ycombinator.com/item?id=35852360','50 minutes ago','elorant','https://news.ycombinator.com/user?id=elorant')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T13:11:42','AMD promises its new laptop chips will crush the Apple M2 and it''s got receipts','https://www.techradar.com/news/amd-promises-its-new-laptop-chips-will-crush-the-apple-m2-and-its-got-reciepts','81 points','https://news.ycombinator.com/item?id=35851174','5 hours ago','jacooper','https://news.ycombinator.com/user?id=jacooper')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T21:18:24','Amazon Tried Not to Pay a Woman After Driver Totaled Her Car','https://jalopnik.com/amazon-wrecked-womans-car-and-tried-not-to-pay-her-1850409798','34 points','https://news.ycombinator.com/item?id=35855696','43 minutes ago','t23','https://news.ycombinator.com/user?id=t23')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T18:39:31','America''s jobs report is not as strong as it seems','https://www.economist.com/graphic-detail/2023/05/05/americas-jobs-report-is-not-as-strong-as-it-seems','7 points','https://news.ycombinator.com/item?id=35854263','4 hours ago','mfiguiere','https://news.ycombinator.com/user?id=mfiguiere')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-08T00:14:35','Ancient Earth Globe','https://dinosaurpictures.org/ancient-earth/#470','95 points','https://news.ycombinator.com/item?id=35856820','3 hours ago','ohjeez','https://news.ycombinator.com/user?id=ohjeez')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T17:23:17','Ask HN: What productivity tools do you use?','item?id=35853576','20 points','https://news.ycombinator.com/item?id=35853576','2 hours ago','ta6304364549','https://news.ycombinator.com/user?id=ta6304364549')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T17:11:14','Ball Aerospace Deep Impact''s impactor simulation software (2006)','https://web.archive.org/web/20060830053522/http://www.ballaerospace.com/inter.exe','6 points','https://news.ycombinator.com/item?id=35853466','3 hours ago','marcodiego','https://news.ycombinator.com/user?id=marcodiego')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T13:09:52','Before Dylan, There Was Connie Converse. Then She Vanished','https://www.nytimes.com/2023/05/06/nyregion/connie-converse-nyc.html','25 points','https://news.ycombinator.com/item?id=35851156','2 hours ago','tintinnabula','https://news.ycombinator.com/user?id=tintinnabula')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T04:14:32','Belgium legalises ethical hacking','https://www.law.kuleuven.be/citip/blog/belgium-legalises-ethical-hacking-a-threat-or-an-opportunity-for-cybersecurity/','393 points','https://news.ycombinator.com/item?id=35847860','14 hours ago','jruohonen','https://news.ycombinator.com/user?id=jruohonen')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T21:37:39','Branding in the real world: acronym branding (2016)','https://www.brandingmag.com/2016/09/28/branding-in-the-real-world-acronym-branding/','8 points','https://news.ycombinator.com/item?id=35855858','3 hours ago','walterbell','https://news.ycombinator.com/user?id=walterbell')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T08:59:41','Burnout','https://drewdevault.com/2023/05/01/2023-05-01-Burnout.html','216 points','https://news.ycombinator.com/item?id=35849384','9 hours ago','emerongi','https://news.ycombinator.com/user?id=emerongi')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-08T01:40:16','California Defaults on $18.5B Debt, Leaving CA Businesses Liable','https://www.hoover.org/research/california-defaults-185-billion-debt-leaving-state-businesses-holding-bag','4 points','https://news.ycombinator.com/item?id=35857223','17 minutes ago','walterbell','https://news.ycombinator.com/user?id=walterbell')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-06T06:55:28','Classic Sesame Street – Computer Trouble','https://www.youtube.com/watch?v=tCHKIdup5Lo','57 points','https://news.ycombinator.com/item?id=35838826','10 hours ago','doener','https://news.ycombinator.com/user?id=doener')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T10:40:15','Contrast Rebellion','https://contrastrebellion.com/','238 points','https://news.ycombinator.com/item?id=35850044','16 hours ago','gjvc','https://news.ycombinator.com/user?id=gjvc')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T15:33:46','Cory Doctorow Explains Why Big Tech Is Making the Internet Terrible','https://jacobin.com/2023/05/cory-doctorow-big-tech-internet-monopoly-capitalism-artificial-intelligence-crypto/','18 points','https://news.ycombinator.com/item?id=35852482','1 hour ago','jlpcsl','https://news.ycombinator.com/user?id=jlpcsl')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T19:30:18','Cyberpunk 2077''s Path Tracing Update','https://chipsandcheese.com/2023/05/07/cyberpunk-2077s-path-tracing-update/','84 points','https://news.ycombinator.com/item?id=35854772','4 hours ago','gautamcgoel','https://news.ycombinator.com/user?id=gautamcgoel')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T07:37:36','DIY-Thermocam: A low-cost thermal imager based on the FLIR Lepton sensor','https://www.diy-thermocam.net/','92 points','https://news.ycombinator.com/item?id=35848872','10 hours ago','rittermax','https://news.ycombinator.com/user?id=rittermax')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T08:08:19','EU sends Apple stark warning over USB-C charging on new iPhones','https://www.techradar.com/news/apple-may-not-restrict-usb-c-charging-on-new-iphones-after-all','352 points','https://news.ycombinator.com/item?id=35849043','14 hours ago','Vedor','https://news.ycombinator.com/user?id=Vedor')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-08T01:10:14','Early Artificial Intelligence Projects: A Student Perspective (2006)','https://projects.csail.mit.edu/films/aifilms/AIFilms.html','3 points','https://news.ycombinator.com/item?id=35857070','1 hour ago','onemind','https://news.ycombinator.com/user?id=onemind')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T07:11:53','Effect of LSD on reinforcement learning in humans (2022)','https://www.cambridge.org/core/journals/psychological-medicine/article/effect-of-lysergic-acid-diethylamide-lsd-on-reinforcement-learning-in-humans/28E41FEE97D3A8614C77DC54DF501489','99 points','https://news.ycombinator.com/item?id=35848764','10 hours ago','nabla9','https://news.ycombinator.com/user?id=nabla9')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-04T03:32:05','Firesky – The Bluesky Firehose','https://firesky.tv/','98 points','https://news.ycombinator.com/item?id=35810901','15 hours ago','ericzawo','https://news.ycombinator.com/user?id=ericzawo')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T16:33:52','Five Books: The best books on everything','https://fivebooks.com/','82 points','https://news.ycombinator.com/item?id=35853131','6 hours ago','pps','https://news.ycombinator.com/user?id=pps')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T08:58:10','Free Public Domain Audiobooks','https://librivox.org/','53 points','https://news.ycombinator.com/item?id=35849368','14 hours ago','doener','https://news.ycombinator.com/user?id=doener')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T12:22:24','From XON/XOFF to Forward Incremental Search (2022)','https://susam.net/blog/from-xon-xoff-to-forward-incremental-search.html','9 points','https://news.ycombinator.com/item?id=35850690','2 hours ago','ossusermivami','https://news.ycombinator.com/user?id=ossusermivami')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T08:57:04','Google Analytics alternative that protects your data and your customers'' privacy','https://matomo.org/','99 points','https://news.ycombinator.com/item?id=35849356','7 hours ago','doener','https://news.ycombinator.com/user?id=doener')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T08:39:49','Google Calendar and Assistant Reminders Will Migrate to Google Tasks Soon','https://workspaceupdates.googleblog.com/2023/02/calendar-and-assistant-reminders-to-tasks-migration.html','97 points','https://news.ycombinator.com/item?id=35849243','7 hours ago','e2e4','https://news.ycombinator.com/user?id=e2e4')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T17:28:52','How to make smaller C and C++ binaries','http://ptspts.blogspot.com/2013/12/how-to-make-smaller-c-and-c-binaries.html','92 points','https://news.ycombinator.com/item?id=35853625','5 hours ago','costco','https://news.ycombinator.com/user?id=costco')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T08:11:16','I''m never investing in Google''s smart home ecosystem again','https://www.androidauthority.com/google-smart-home-3319869/','374 points','https://news.ycombinator.com/item?id=35849060','10 hours ago','Corrado','https://news.ycombinator.com/user?id=Corrado')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-06T18:36:26','Implementing Value Speculation in OCaml','https://www.lortex.org/articles/value-speculation-ocaml/','62 points','https://news.ycombinator.com/item?id=35844078','7 hours ago','Smaug123','https://news.ycombinator.com/user?id=Smaug123')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T23:52:14','Inductive charging highway section to be built in Florida','https://www.electrive.com/2023/05/02/inductive-charging-highway-section-to-be-built-in-florida/','7 points','https://news.ycombinator.com/item?id=35856722','2 hours ago','thesuperbigfrog','https://news.ycombinator.com/user?id=thesuperbigfrog')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-08T00:51:48','Intel Skulltrail','https://en.wikipedia.org/wiki/Intel_Skulltrail','9 points','https://news.ycombinator.com/item?id=35856986','1 hour ago','Kye','https://news.ycombinator.com/user?id=Kye')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T16:57:55','Lamest Edit Wars','https://en.wikipedia.org/wiki/Wikipedia:Lamest_edit_wars','97 points','https://news.ycombinator.com/item?id=35853338','9 hours ago','justin66','https://news.ycombinator.com/user?id=justin66')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T04:03:06','Large-scale study reveals autoimmune disorders now affect around one in ten','https://www.gla.ac.uk/news/headline_952084_en.html','224 points','https://news.ycombinator.com/item?id=35847814','20 hours ago','CharlesW','https://news.ycombinator.com/user?id=CharlesW')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T16:58:46','LattePanda Sigma – A Hackable Single Board Server with Mighty Power','https://www.lattepanda.com/lattepanda-sigma','27 points','https://news.ycombinator.com/item?id=35853344','1 hour ago','peter_d_sherman','https://news.ycombinator.com/user?id=peter_d_sherman')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T17:23:53','Makeitfrom.com – Material Properties Database','https://www.makeitfrom.com/','47 points','https://news.ycombinator.com/item?id=35853580','11 hours ago','rayshan','https://news.ycombinator.com/user?id=rayshan')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T01:10:02','Marlo Ciciliani: Mask (for no input mixer, 2004)','https://www.ciciliani.com/mask.html','14 points','https://news.ycombinator.com/item?id=35846885','3 hours ago','brudgers','https://news.ycombinator.com/user?id=brudgers')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T05:42:52','Measuring the HP 11720A Pulse Modulator and Coax Cables','https://tomverbeure.github.io/2023/05/06/HP-11720A-Pulse-Modulator.html','24 points','https://news.ycombinator.com/item?id=35848276','10 hours ago','picture','https://news.ycombinator.com/user?id=picture')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T05:38:54','Memoirs from the old web: IE''s crazy content rating system','https://www.devever.net/~hl/pics','92 points','https://news.ycombinator.com/item?id=35848267','10 hours ago','tempodox','https://news.ycombinator.com/user?id=tempodox')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T21:22:16','Neil Postman: A civilized man in a century of barbarism (2003)','https://www.salon.com/2003/10/10/postman/','40 points','https://news.ycombinator.com/item?id=35855737','7 hours ago','blueridge','https://news.ycombinator.com/user?id=blueridge')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T18:20:30','OpenAI CEO says the remote work ''experiment'' was a mistake–and ''it''s over''','https://fortune.com/2023/05/05/openai-ceo-sam-altman-remote-work-mistake-return-to-office/','11 points','https://news.ycombinator.com/item?id=35854087','42 minutes ago','lopkeny12ko','https://news.ycombinator.com/user?id=lopkeny12ko')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T15:20:54','OpenAI Sued for Fraud Allegations','https://webapps.sftc.org/captcha/captcha.dll?referrer=https://webapps.sftc.org/ci/CaseInfo.dll?CaseNum=CGC23606176','66 points','https://news.ycombinator.com/item?id=35852364','44 minutes ago','iamnotarobotman','https://news.ycombinator.com/user?id=iamnotarobotman')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-08T03:23:54','Operation Epsilon','https://en.wikipedia.org/wiki/Operation_Epsilon','20 points','https://news.ycombinator.com/item?id=35857731','1 hour ago','altilunium','https://news.ycombinator.com/user?id=altilunium')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T18:34:47','Passkeys: A Loss of User Control?','https://lapcatsoftware.com/articles/2023/5/1.html','90 points','https://news.ycombinator.com/item?id=35854216','2 hours ago','ingve','https://news.ycombinator.com/user?id=ingve')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T15:00:25','Pixel phones are sold with bootloader unlocking disabled','https://www.fitzsim.org/blog/?p=545','66 points','https://news.ycombinator.com/item?id=35852192','3 hours ago','pabs3','https://news.ycombinator.com/user?id=pabs3')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T20:36:50','Prolog for Data Science','https://emiruz.com/post/2023-04-30-prolog-for-data-science/','95 points','https://news.ycombinator.com/item?id=35855398','6 hours ago','usgroup','https://news.ycombinator.com/user?id=usgroup')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T08:39:09','Push 3.0 Programming Language Description (2004)','http://faculty.hampshire.edu/lspector/push3-description.html','9 points','https://news.ycombinator.com/item?id=35849241','2 hours ago','optimalsolver','https://news.ycombinator.com/user?id=optimalsolver')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T06:19:50','React Aria Components','https://react-spectrum.adobe.com/react-aria/react-aria-components.html','92 points','https://news.ycombinator.com/item?id=35848421','12 hours ago','itsuka','https://news.ycombinator.com/user?id=itsuka')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T02:17:10','RedisRaft','https://github.com/RedisLabs/redisraft/blob/master/docs/Introduction.md','126 points','https://news.ycombinator.com/item?id=35847269','14 hours ago','anhldbk','https://news.ycombinator.com/user?id=anhldbk')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T15:06:46','Russians Seem Interested in My Book About How Dictatorships End','https://www.almendron.com/tribuna/russians-seem-very-interested-in-my-book-about-how-dictatorships-end/','44 points','https://news.ycombinator.com/item?id=35852242','58 minutes ago','tokai','https://news.ycombinator.com/user?id=tokai')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-06T14:28:21','Scientists Might Have Found the Best Way to Catcall a Cat','https://gizmodo.com/your-cat-knows-when-youre-using-your-cat-talk-voice-1849695518','12 points','https://news.ycombinator.com/item?id=35841703','2 hours ago','gumby','https://news.ycombinator.com/user?id=gumby')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-06T03:39:58','Secd: A silly implementation of the SECD machine','https://github.com/zachallaun/secd','35 points','https://news.ycombinator.com/item?id=35837747','12 hours ago','luu','https://news.ycombinator.com/user?id=luu')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T09:59:50','Show HN: Devil Mode: A twisted Emacs key translator for modifier-free editing','https://github.com/susam/devil','46 points','https://news.ycombinator.com/item?id=35849788','10 hours ago','susam','https://news.ycombinator.com/user?id=susam')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T20:44:09','Show HN: What do you think about my metasearch engine?','https://svmetasearch.eu.org','31 points','https://news.ycombinator.com/item?id=35855454','8 hours ago','SlaVistaPL','https://news.ycombinator.com/user?id=SlaVistaPL')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-08T01:22:13','SkyLink – Bluesky DID Detector browser plugin','https://github.com/jessejanderson/skylink','17 points','https://news.ycombinator.com/item?id=35857134','3 hours ago','mooreds','https://news.ycombinator.com/user?id=mooreds')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T20:51:41','Some early praise for using drgn for poking into Linux kernel internals','https://utcc.utoronto.ca/~cks/space/blog/linux/DrgnKernelPokingPraise','36 points','https://news.ycombinator.com/item?id=35855502','8 hours ago','ingve','https://news.ycombinator.com/user?id=ingve')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T22:00:50','SpaceTraders: A multiplayer game built on a free web API','https://spacetraders.io/','40 points','https://news.ycombinator.com/item?id=35856036','7 hours ago','akpa1','https://news.ycombinator.com/user?id=akpa1')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T07:11:23','TV series about startup failures','https://www.1984.design/c/discussions/tv-series-about-startup-failures-portraying-their-greedy-founders-and-the-damages-of-the-current-startup-ecosystem','179 points','https://news.ycombinator.com/item?id=35848758','14 hours ago','boraoztunc','https://news.ycombinator.com/user?id=boraoztunc')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T18:08:26','The AI revolution is powered by these contractors making $15 an hour','https://www.nbcnews.com/tech/innovation/openai-chatgpt-ai-jobs-contractors-talk-shadow-workforce-powers-rcna81892','41 points','https://news.ycombinator.com/item?id=35853979','54 minutes ago','marban','https://news.ycombinator.com/user?id=marban')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T21:47:59','The Beginner''s Guide to eBPF','https://github.com/lizrice/ebpf-beginners','60 points','https://news.ycombinator.com/item?id=35855929','7 hours ago','mooreds','https://news.ycombinator.com/user?id=mooreds')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-06T14:56:17','The Language of Democracy','https://www.dissentmagazine.org/online_articles/language-democracy-christopher-lasch-plain-style','41 points','https://news.ycombinator.com/item?id=35841961','8 hours ago','samclemens','https://news.ycombinator.com/user?id=samclemens')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T13:51:27','The Messy Page Or: why I don''t like greenfield projects','https://registerspill.thorstenball.com/p/the-messy-page','67 points','https://news.ycombinator.com/item?id=35851508','10 hours ago','tim_sw','https://news.ycombinator.com/user?id=tim_sw')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T16:36:33','The Prime Video microservices to monolith story','https://adrianco.medium.com/so-many-bad-takes-what-is-there-to-learn-from-the-prime-video-microservices-to-monolith-story-4bd0970423d4','69 points','https://news.ycombinator.com/item?id=35853148','1 hour ago','mparnisari','https://news.ycombinator.com/user?id=mparnisari')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T13:14:21','The Rocky Horror Coffin Clock','https://burialsandbeyond.com/2023/05/07/the-rocky-horror-coffin-clock/','99 points','https://news.ycombinator.com/item?id=35851200','2 hours ago','Amorymeltzer','https://news.ycombinator.com/user?id=Amorymeltzer')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T13:25:52','The Scoop on Solar Geoengineering','https://www.technologyreview.com/2023/05/04/1072603/the-inside-scoop-on-solar-geoengineering/','7 points','https://news.ycombinator.com/item?id=35851303','2 hours ago','wallflower','https://news.ycombinator.com/user?id=wallflower')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T02:28:55','The businessman and the fisherman (1963)','https://thestorytellers.com/the-businessman-and-the-fisherman/','71 points','https://news.ycombinator.com/item?id=35847327','14 hours ago','antimora','https://news.ycombinator.com/user?id=antimora')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T17:24:42','The first planetarium projector was unveiled 100 years ago','https://planetarium100.org/','8 points','https://news.ycombinator.com/item?id=35853588','3 hours ago','Tea418','https://news.ycombinator.com/user?id=Tea418')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T08:52:03','The tale of "-mrtd" in GCC and Clang','https://m680x0.github.io/blog/2023/05/the-tale-of-mrtd.html','75 points','https://news.ycombinator.com/item?id=35849313','14 hours ago','cbmuser','https://news.ycombinator.com/user?id=cbmuser')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T19:55:41','Turbo Rascal Syntax Error','https://lemonspawn.com/turbo-rascal-syntax-error-expected-but-begin/','88 points','https://news.ycombinator.com/item?id=35855029','4 hours ago','6581','https://news.ycombinator.com/user?id=6581')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T06:12:56','Two seventeenth century atlases digitised and online (2022)','https://blogs.bl.uk/magnificentmaps/2022/12/norden-and-van-den-keere-two-seventeenth-century-atlases-digitised-and-online.html','31 points','https://news.ycombinator.com/item?id=35848397','9 hours ago','benbreen','https://news.ycombinator.com/user?id=benbreen')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-08T01:57:03','US banking crisis: Warren Buffett says bosses should face ''punishment''','https://www.theguardian.com/business/2023/may/07/us-banking-crisis-warren-buffett-says-bosses-should-face-punishment','93 points','https://news.ycombinator.com/item?id=35857295','2 hours ago','jimnotgym','https://news.ycombinator.com/user?id=jimnotgym')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-06T19:26:59','Using predictions from arbitrary models to get tighter confidence intervals','https://statmodeling.stat.columbia.edu/2023/05/04/using-predictions-from-arbitrary-models-to-get-tighter-confidence-intervals/','8 points','https://news.ycombinator.com/item?id=35844574','2 hours ago','luu','https://news.ycombinator.com/user?id=luu')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T13:33:52','VW to fire top executives at software unit Cariad, source says','https://www.reuters.com/business/autos-transportation/vw-fire-top-executives-software-unit-cariad-source-says-2023-05-06/','55 points','https://news.ycombinator.com/item?id=35851369','2 hours ago','sva_','https://news.ycombinator.com/user?id=sva_')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-08T02:26:56','Vint Cerf on 3 Mistakes He Made in TCP/IP','https://spectrum.ieee.org/vint-cerf-mistakes','15 points','https://news.ycombinator.com/item?id=35857439','2 hours ago','em3rgent0rdr','https://news.ycombinator.com/user?id=em3rgent0rdr')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T15:59:07','Vulkan Video Decoding','https://wickedengine.net/2023/05/07/vulkan-video-decoding/','7 points','https://news.ycombinator.com/item?id=35852774','2 hours ago','ibobev','https://news.ycombinator.com/user?id=ibobev')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T17:43:38','Waking up to Hacker News','https://johnathannader.com/waking-hacker-news/','54 points','https://news.ycombinator.com/item?id=35853764','2 hours ago','nadermx','https://news.ycombinator.com/user?id=nadermx')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T07:40:52','Walkout at global science journal over ''unethical'' fees','https://www.theguardian.com/science/2023/may/07/too-greedy-mass-walkout-at-global-science-journal-over-unethical-fees','477 points','https://news.ycombinator.com/item?id=35848894','14 hours ago','mindracer','https://news.ycombinator.com/user?id=mindracer')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T13:09:52','When Connie Converse, the ''female Bob Dylan,'' lived in NYC','https://www.nytimes.com/2023/05/06/nyregion/connie-converse-nyc.html','69 points','https://news.ycombinator.com/item?id=35851156','11 hours ago','tintinnabula','https://news.ycombinator.com/user?id=tintinnabula')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T15:15:44','Why Lisp?','https://nyxt.atlas.engineer/article/why-lisp.org','96 points','https://news.ycombinator.com/item?id=35852321','3 hours ago','mepian','https://news.ycombinator.com/user?id=mepian')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T16:00:01','Why the Ferrari F355 sounds so good','https://www.roadandtrack.com/news/a43805754/ferrari-f355-exhaust-sound/','50 points','https://news.ycombinator.com/item?id=35852783','5 hours ago','ptrkcsk','https://news.ycombinator.com/user?id=ptrkcsk')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-08T02:30:37','You don''t need Scrum. You just need to do Kanban right (2022)','https://lucasfcosta.com/2022/10/02/scrum-versus-kanban.html','57 points','https://news.ycombinator.com/item?id=35857463','1 hour ago','thunderbong','https://news.ycombinator.com/user?id=thunderbong')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
INSERT INTO stories
(datetime, title, link, score, comment_url, comment_count, username, userlink)
VALUES('2023-05-07T03:41:19','macOS Internals','https://gist.github.com/kconner/cff08fe3e0bb857ea33b47d965b3e19f','700 points','https://news.ycombinator.com/item?id=35847715','1 day ago','JoelMcCracken','https://news.ycombinator.com/user?id=JoelMcCracken')
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count;
