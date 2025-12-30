---
title: Frequently Asked Questions
---

<div class="iode-faq" markdown="1">

Click a question to expand and see the answer.

## Company

??? question "Who is iodé?"
    iodé is a French-based company headquartered in Toulouse, with an international team of cybersecurity and design experts. The company develops **iodéOS**, a privacy-focused Android operating system, and sells refurbished and new iodé smartphones online and through selected retailers.

??? question "Why does iodé exist?"
    Large technology companies collect vast amounts of personal data. iodé was created to offer an Android-based alternative designed to protect user privacy and limit data tracking.

??? question "How is iodé pronounced?"
    iodé is pronounced **“jɔ.de”**.


## iodéOS (Operating System)

??? question "How are system updates delivered?"
    System updates are delivered **over-the-air (OTA)** and include security patches and feature improvements.

??? question "How does iodéOS differ from standard Android?"
    iodéOS integrates additional privacy features, including:

    - Built-in tracker and ad blocking
    - Network activity visibility per application
    - Aurora Store and F-Droid app stores
    - microG instead of Google Play Services
    - Enhanced privacy and security controls

??? question "Can iodéOS be installed manually?"
    Yes. iodéOS is free to install, and official installation guides are provided.

??? question "Why are two app stores included?"
    - **Aurora Store:** Provides access to Play Store apps with tracker transparency
    - **F-Droid:** Offers exclusively open-source applications

??? question "What is microG?"
    microG is an open-source replacement for Google Play Services that allows many applications to function without relying on Google infrastructure.

## iodé Blocker

??? question "What is the iodé blocker?"
    The iodé blocker is a system-level privacy tool that blocks trackers, advertisements, and malicious network requests.

??? question "What is a tracker?"
    A tracker is software that collects user data and sends it to third parties.

??? question "How are trackers blocked?"
    The iodé blocker monitors DNS requests and blocks known tracking domains.

??? question "What is DNS?"
    The Domain Name System (DNS) translates human-readable domain names into IP addresses.

??? question "Does the blocker work with DoH or DoT?"
    The blocker intercepts DNS requests before resolution, except in cases where applications use embedded encrypted DNS.

??? question "How is network traffic analyzed?"
    After DNS resolution, iodéOS analyzes network sockets and displays sent and received data per application.

??? question "How are server locations identified?"
    Server locations are determined using IP geolocation databases based on resolved DNS data.

??? question "How can users verify that trackers are blocked?"
    Blocklists are updated regularly and can be customized by users.

## Usage & Troubleshooting

??? question "Why does an application not work?"
    Applications may fail due to missing Google services or overly restrictive blocking rules. Adjusting block settings or reinstalling the app may resolve the issue.

??? question "What to do when Aurora Store wouldn't connect?"
    Users should try logging out and back in, clearing the app storage, or changing the token provider.

??? question "Why can’t the phone be located?"
    microG location modules and permissions should be checked.

??? question "How are emojis sent?"
    Press and hold the newline key, then slide to the emoji icon.

??? question "How are files transferred via USB?"
    Go to **Settings → Connected devices → USB → File transfer**.

??? question "How does microG geolocation work?"
    Location is determined using GPS, Wi-Fi, Bluetooth, and cellular data.

??? question "Is iodéOS rooted by default?"
    No. Root access requires third-party tools such as Magisk.

??? question "How often are updates released?"
    Updates are generally released **monthly**.

??? question "Why are notifications not received?"
    microG Cloud Messaging registration should be checked.

??? question "Why can’t Google Play Services be updated in Aurora Store?"
    microG uses the same package name as Google Play Services, which causes update prompts that cannot be installed.

</div>
