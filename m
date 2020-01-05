Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AE1130853
	for <lists+nbd@lfdr.de>; Sun,  5 Jan 2020 14:54:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 73211206EE; Sun,  5 Jan 2020 13:54:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jan  5 13:54:09 2020
Old-Return-Path: <jelezarov.vladimir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 25BEE20967
	for <lists-other-nbd@bendel.debian.org>; Sun,  5 Jan 2020 13:36:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.321 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	HTML_MESSAGE=2, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 15FMA9j9-sF9 for <lists-other-nbd@bendel.debian.org>;
	Sun,  5 Jan 2020 13:36:29 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A6D5C20964
	for <nbd@other.debian.org>; Sun,  5 Jan 2020 13:36:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f129so12608241wmf.2
        for <nbd@other.debian.org>; Sun, 05 Jan 2020 05:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:references:to:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=E1HrXiCQRavdCSR3aHi6yDeVQFetTlHUF5o5hYT3tsQ=;
        b=QrkEgfklh4xJIgcQ9S7baCHq07DkTj7eCedZWXWnW1dDuhnUbBG+zrD0M2/xcQHDuc
         b0Zrl0T+LIqddNgNsfBfG8mlolqgG+KMN8PzIKG7RRA/QrlObuU1cf8saE3jBTlMhmMP
         61rga80YB7f9kpLG3jGldwrNk4/hEdXWzIItSWVnU5CRS858xV7g7sC1qBVwLGlxQX2V
         BnafZx7Pb8sElvim1yIjMrxg4UPxxBIN+elbyWISIuP9VK5CIsmd/uNGpqGPUS0IUnkN
         o6cnR5PZ14GM5cp5Z28tUfFuqzzcEa7AyYH/fk2G4Vd+s9Fjtp75i6RnMFgJuW141AqF
         ViWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:references:to:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=E1HrXiCQRavdCSR3aHi6yDeVQFetTlHUF5o5hYT3tsQ=;
        b=fQw39l3jOH7pXOA7ragwP/M4zVt1oAhS2pFsQaOqqquxYjjaJoRN0KFFRaaA5aBU8o
         zfxevGUN0Bb6Jt5pBsbR4HXpYxGiNk248DFSCPthzx1CHeRdglm4YtBot49F9WaP/nZB
         oeSUh+LBKrC6qx1JN1QYq+I5fX58R2YGyeF5ewMJ1exO+WJAy4/zgEC1Rnt5aIEi9odw
         ipDWRCnlW+q3vlzoqIAXZ7ObgOIYxkqQUXHN0nrNK2Ccwra2m/i4c3MFSRBboOhf1WZS
         mw9ct31sW1gCCvUcIphTaqNRKSeSSa7vBdzf9aOU8Xv/mkn7rvLTLrSTzEYwOgqi4u0a
         53Fw==
X-Gm-Message-State: APjAAAVeLDlHeL2iePoUwBig8XpCGT/9InzvnXtO5g1PMXLCyAT0kpgQ
	5aiUvbyt2pJczr/XhqMg9u1eeJSB
X-Google-Smtp-Source: APXvYqxhjZK5nts8L4WBd3a3VmyLiNZiiQimxQRXd4FYThzOwwBv1d4UnVExZ7bYk5syoEQnMzdvbQ==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr30649378wmd.7.1578231386231;
        Sun, 05 Jan 2020 05:36:26 -0800 (PST)
Received: from [172.28.28.28] (ip1f1234d3.dynamic.kabel-deutschland.de. [31.18.52.211])
        by smtp.gmail.com with ESMTPSA id o1sm68315493wrn.84.2020.01.05.05.36.25
        for <nbd@other.debian.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2020 05:36:25 -0800 (PST)
Subject: [PATCH] More debugging info when failing to open multiple files
References: <8ceb098b-7a80-03be-64cf-7d8def8f6907@gmail.com>
To: nbd@other.debian.org
From: Vladimir Jelezarov <jelezarov.vladimir@gmail.com>
X-Forwarded-Message-Id: <8ceb098b-7a80-03be-64cf-7d8def8f6907@gmail.com>
Message-ID: <15aaa900-b5ac-f865-c8b5-e66fa078e1e2@gmail.com>
Date: Sun, 5 Jan 2020 14:36:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <8ceb098b-7a80-03be-64cf-7d8def8f6907@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------3150788066C37CD6108575F6"
Content-Language: en-US
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2OrnV6O9NRL.A.pVG.BqeEeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/767
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/15aaa900-b5ac-f865-c8b5-e66fa078e1e2@gmail.com
Resent-Date: Sun,  5 Jan 2020 13:54:09 +0000 (UTC)

This is a multi-part message in MIME format.
--------------3150788066C37CD6108575F6
Content-Type: multipart/alternative;
 boundary="------------0D3D5A3802556A9C22F12313"


--------------0D3D5A3802556A9C22F12313
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,


When nbd-server with the "multifile = true" option is fed with more 
files than the current system's limit, it silently opens files up to the 
limit and then proceeds with no error message thrown, even in debugging 
mode "-d". As a result, not the entire expected file size shows in 
/dev/nbdX, which can be confusing.

I propose adding at least an "err_nonfatal" warning when in debug mode.


1885,1886c1885,1888
<                 if(multifile && i>0)
<                     break;
---
 >                 if(multifile && i>0) {
                      err_nonfatal(strerror(errno));
                      break;
 >                 }


Greetings

Vladimir





-------- Forwarded Message --------
Subject: 	Is there a limit on the count of the exported devices?
Date: 	Sat, 4 Jan 2020 21:20:40 +0100
From: 	Vladimir Zhelezarov <jelezarov.vladimir@gmail.com>
To: 	nbd@other.debian.org



Hi,

independent of the size of the combined block device, I am unable to use 
more than 1018 devices with the "-m" option in nbd-server. So for example:


    for i in {0..1999}; do truncate -s 1M mm.$i; done
    sudo nbd-server -C /dev/null localhost@33333 -m /home/user/nbd/mm
    sudo nbd-client localhost 33333 /dev/nbd0


Then it says:

    Negotiation: ..size = 1018MB
    bs=1024, sz=1067450368 bytes

which can also be confirmed by mounting /dev/nbd0.


Another example with 5000 files of 500K gives:

    Negotiation: ..size = 497MB
    bs=1024, sz=521216000 bytes

which gives the same 521216000/1024/500 = 1018 used files.


The same happens when using different sizes or combinations of sizes and 
file-counts. I am using nbd 3.20 on x64 Ubuntu 18.04. Using a 
configuration file makes no difference. Different hardware with the same 
OS and nbd version neither.


Can someone give me some pointers?


Vladimir


--------------0D3D5A3802556A9C22F12313
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi all,</p>
    <p><br>
    </p>
    <p>When nbd-server with the "multifile = true" option is fed with
      more files than the current system's limit, it silently opens
      files up to the limit and then proceeds with no error message
      thrown, even in debugging mode "-d". As a result, not the entire
      expected file size shows in /dev/nbdX, which can be confusing.<br>
    </p>
    <p>I propose adding at least an "err_nonfatal" warning when in debug
      mode.</p>
    <p><br>
    </p>
    <p>1885,1886c1885,1888<br>
      &lt;                 if(multifile &amp;&amp; i&gt;0)<br>
      &lt;                     break;<br>
      ---<br>
      &gt;                 if(multifile &amp;&amp; i&gt;0) {<br>
                           err_nonfatal(strerror(errno));<br>
                           break;<br>
      &gt;                 }<br>
      <br>
    </p>
    <p><br>
    </p>
    <p>Greetings</p>
    <p>Vladimir</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <div class="moz-forward-container"><br>
      <br>
      -------- Forwarded Message --------
      <table class="moz-email-headers-table" cellspacing="0"
        cellpadding="0" border="0">
        <tbody>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Subject:
            </th>
            <td>Is there a limit on the count of the exported devices?</td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Date: </th>
            <td>Sat, 4 Jan 2020 21:20:40 +0100</td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">From: </th>
            <td>Vladimir Zhelezarov <a class="moz-txt-link-rfc2396E" href="mailto:jelezarov.vladimir@gmail.com">&lt;jelezarov.vladimir@gmail.com&gt;</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">To: </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:nbd@other.debian.org">nbd@other.debian.org</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <p>Hi,</p>
      <p>independent of the size of the combined block device, I am
        unable to use more than 1018 devices with the "-m" option in
        nbd-server. So for example:</p>
      <p><br>
      </p>
      <blockquote>
        <p>for i in {0..1999}; do truncate -s 1M mm.$i; done<br>
          sudo nbd-server -C /dev/null localhost@33333 -m
          /home/user/nbd/mm<br>
          sudo nbd-client localhost 33333 /dev/nbd0</p>
      </blockquote>
      <p><br>
      </p>
      <p>Then it says:</p>
      <blockquote>
        <p>Negotiation: ..size = 1018MB<br>
          bs=1024, sz=1067450368 bytes<br>
        </p>
      </blockquote>
      <p>which can also be confirmed by mounting /dev/nbd0.</p>
      <p><br>
      </p>
      <p>Another example with 5000 files of 500K gives:</p>
      <blockquote>
        <p>Negotiation: ..size = 497MB<br>
          bs=1024, sz=521216000 bytes<br>
        </p>
      </blockquote>
      <p>which gives the same 521216000/1024/500 = 1018 used files.<br>
      </p>
      <p><br>
      </p>
      <p>The same happens when using different sizes or combinations of
        sizes and file-counts. I am using nbd 3.20 on x64 Ubuntu 18.04.
        Using a configuration file makes no difference. Different
        hardware with the same OS and nbd version neither.<br>
      </p>
      <p><br>
      </p>
      <p>Can someone give me some pointers?</p>
      <p><br>
      </p>
      <p>Vladimir<br>
      </p>
    </div>
  </body>
</html>

--------------0D3D5A3802556A9C22F12313--

--------------3150788066C37CD6108575F6
Content-Type: text/plain; charset=UTF-8;
 name="patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="patch"

MTg4NSwxODg2YzE4ODUsMTg4OAo8IAkJCQlpZihtdWx0aWZpbGUgJiYgaT4wKQo8IAkJCQkJ
YnJlYWs7Ci0tLQo+IAkJCQlpZihtdWx0aWZpbGUgJiYgaT4wKSB7CiAJCQkJCWVycl9ub25m
YXRhbChzdHJlcnJvcihlcnJubykpOwogCQkJCQlicmVhazsKPiAJCQkJfQo=
--------------3150788066C37CD6108575F6--

