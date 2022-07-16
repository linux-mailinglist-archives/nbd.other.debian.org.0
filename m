Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 166ED576DF9
	for <lists+nbd@lfdr.de>; Sat, 16 Jul 2022 14:40:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B5A97205E4; Sat, 16 Jul 2022 12:40:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jul 16 12:40:33 2022
Old-Return-Path: <turakar23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,LDOSUBSCRIBER,LDO_WHITELIST,MONEY,RCVD_IN_DNSWL_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8872D20553
	for <lists-other-nbd@bendel.debian.org>; Sat, 16 Jul 2022 12:40:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.959 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	LDO_WHITELIST=-5, MONEY=0.5, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jnP7eOs-rzWC for <lists-other-nbd@bendel.debian.org>;
	Sat, 16 Jul 2022 12:40:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5136B2040A
	for <nbd@other.debian.org>; Sat, 16 Jul 2022 12:40:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id ay11-20020a05600c1e0b00b003a3013da120so4612442wmb.5
        for <nbd@other.debian.org>; Sat, 16 Jul 2022 05:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject;
        bh=WWmDYnLZy2xc5gkQIWPxcSQygVnKK1aSpfUmy34qyqU=;
        b=bxQamxja2xBroXqRfY95HZ47SFs9Mi3eEgFziD3RMDmN5fBRSEzrqr02dTgj33OI0L
         msprYazZsTJkd3xVRaay6JANEcrpZbcCeHzWTecfsNK0jHyve+WQVrav+P7pAwfNDoyX
         MUyDkJfA2poMbyFiGnltt7hFCX118XQ6poEtgKvBEDJ2vKnNjmlP8XaVBIEy5fAPSdrL
         ULu0UqoWmrXPkOXMaeispAwxwqkJE8BUISidU+9/JmS239E5igoIgaIvbSjX7ykMbncU
         YsIjlZ0vAxEl9mD3wkUOMTv2upTTElg7H4H5Vo4PVjdQw1o3IagTAejD9lYVqPxu9Bp1
         46ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject;
        bh=WWmDYnLZy2xc5gkQIWPxcSQygVnKK1aSpfUmy34qyqU=;
        b=V9QgxUdcFGZ2BtJnn71QjnIgaZsZmMk8tgUuBpAiFVkyCtRswMq91ZykHmrwjPMiXU
         Ch5atcDeluz7wTBHIKkjQOeZqQ/IjxHUfRnMlIQsXLY9WbrIfUp/+366NdW1nXDd3vtd
         /5i66+/kCu/SDnhG0EbVvSBX4CWk5J9heEu8bpkk4rMsyiYW+1MuMsZs7vJIdkY6Vq4r
         iKNAJ7f7s60+C1gGlqMlgUluSbvPN+ujUJW1z1At1/trbYn01JEqiKOKiZzRBfXJQt0Y
         CGpMzJZQI3i41xNb4mFwEAo5KIoVh35iWMxAGZG4MTWSdkfCGUyELSrP7zjyGB/GNFb1
         7ZLA==
X-Gm-Message-State: AJIora8YXhgrIiLWP0bRA9gqZOYeaVjqoaHl+4gHl10eaCnUZFgFWcNl
	x3z/QbTX0Gie4Gukt6iUW2XZyjb5GAIrgJXwVDvJVQ==
X-Google-Smtp-Source: AGRyM1t87kRw9Os6fRjnJooZkBJ/JZCVLyd3PFhxB9r8zjhaOO3uUr7YhnD+M+M3UMqSq76R4hurvg==
X-Received: by 2002:a1c:2785:0:b0:3a2:dcff:7903 with SMTP id n127-20020a1c2785000000b003a2dcff7903mr25490659wmn.113.1657975217595;
        Sat, 16 Jul 2022 05:40:17 -0700 (PDT)
Received: from [172.16.0.54] (p578c5cab.dip0.t-ipconnect.de. [87.140.92.171])
        by smtp.gmail.com with ESMTPSA id l26-20020a1ced1a000000b003a17ab4e7c8sm11901915wmh.39.2022.07.16.05.40.16
        for <nbd@other.debian.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Jul 2022 05:40:17 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------eUgeNPCqyFugrA7iBZvVE8S4"
Message-ID: <618b6ab5-e275-6573-e00d-aa62019089bb@gmail.com>
Date: Sat, 16 Jul 2022 14:40:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: nbd@other.debian.org
Content-Language: en-US
From: Turakar <turakar23@gmail.com>
Subject: Setup NBD with TLS
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EKoGlE8erVB.A.r7F.BHr0iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2189
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/618b6ab5-e275-6573-e00d-aa62019089bb@gmail.com
Resent-Date: Sat, 16 Jul 2022 12:40:33 +0000 (UTC)

This is a multi-part message in MIME format.
--------------eUgeNPCqyFugrA7iBZvVE8S4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I am currently trying to setup nbd-server/nbd-client with TLS 
authentication, but I ran into some difficult error messages. If this is 
the wrong list for support, please feel free to redirect me.

I use one system (Debian 10) for both nbd-server and nbd-client for 
debugging, but want to move to separate hosts later. I used the 
following nbd-server config file:

[generic]
        user = root
        group = root
        includedir = /etc/nbd-server/conf.d

        allowlist = true

# TLS setup
        force_tls = true
        cacertfile = /etc/nbd-server/certificates/ca.cert.pem
        certfile = /etc/nbd-server/certificates/server.cert.pem
        keyfile = /etc/nbd-server/certificates/server.key.pem

[export]
        exportname = /dev/system/nixos
        flush = true

I created the certificates as follows:

$ openssl genrsa -des3 -out ca.key 4096
$ openssl req -new -x509 -days 36500 -key ca.key -out ca.cert.pem
$ openssl genrsa -out server.key 4096
$ openssl req -new -key server.key -out server.csr
$ openssl x509 -req -days 36500 -in server.csr -CA ca.cert.pem -CAkey 
ca.key -CAcreateserial -out server.crt
$ openssl genrsa -out client.key.pem 4096
$ openssl req -new -key -client.key.pem -out client.csr
$ openssl x509 -req -in client.csr -CA ca.cert.pem -CAkey ca.key 
-CAcreateserial -days 36500 -sha512 -out clien
t.cert.pem

And use the following command for testing the connection:

$ nbd-client -l localhost -certfile 
/etc/nbd-server/certificates/client.cert.
pem -keyfile /etc/nbd-server/certificates/client.key.pem -cacertfile 
/etc/nbd-server/certificates/ca.cert.pem -n
Negotiation: ..
Error: Reading magic from server: Connection reset by peer
Exiting.

Thereby, the server log says this:

Jul 16 14:21:28 mini systemd[1]: Started LSB: Network Block Device server.
Jul 16 14:21:30 mini nbd_server[26099]: Spawned a child process
Jul 16 14:21:30 mini nbd_server[26099]: Child exited with 1

Not that informative... Can someone of you spot the problem in my 
configuration?

Remarks: If I set force_tls = False and do not use the certificates with 
nbd-client, it works fine. However, I need TLS encryption for my use case.

Thank you and kind regards,
Turakar

--------------eUgeNPCqyFugrA7iBZvVE8S4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello,</p>
    <p>I am currently trying to setup nbd-server/nbd-client with TLS
      authentication, but I ran into some difficult error messages. If
      this is the wrong list for support, please feel free to redirect
      me.</p>
    <p>I use one system (Debian 10) for both nbd-server and nbd-client
      for debugging, but want to move to separate hosts later. I used
      the following nbd-server config file:</p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">[generic]</span><br>
               user = root
        <br>
               group = root
        <br>
               includedir = /etc/nbd-server/conf.d
        <br>
        <br>
               allowlist = true
        <br>
        <br>
        # TLS setup
        <br>
               force_tls = true
        <br>
               cacertfile = /etc/nbd-server/certificates/ca.cert.pem
        <br>
               certfile = /etc/nbd-server/certificates/server.cert.pem
        <br>
               keyfile = /etc/nbd-server/certificates/server.key.pem
        <br>
        <br>
        [export]
        <br>
               exportname = /dev/system/nixos
        <br>
               flush = true<br>
      </span></p>
    <p>I created the certificates as follows:</p>
    <p><font face="monospace">$ openssl genrsa -des3 -out ca.key 4096<br>
        $ openssl req -new -x509 -days 36500 -key ca.key -out
        ca.cert.pem<br>
        $ openssl genrsa -out server.key 4096<br>
        $ openssl req -new -key server.key -out server.csr<br>
        $ openssl x509 </font><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">-req -days
          36500 -in server.csr -CA ca.cert.pem -CAkey ca.key
          -CAcreateserial -out server.crt<br>
          $ openssl genrsa -out client.key.pem 4096<br>
          $ openssl req -new -key -client.key.pem -out client.csr</span><span
          style="color:#000000;background-color:#ffffff;"><br>
          $ </span></span><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;"><span
            style="font-family:monospace"><span
              style="color:#000000;background-color:#ffffff;">openssl
              x509 -req -in client.csr -CA ca.cert.pem -CAkey ca.key
              -CAcreateserial -days 36500 -sha512 -out clien</span><br>
            t.cert.pem<br>
          </span></span></span></p>
    <p><span style="color:#000000;background-color:#ffffff;">And use the
        following command for testing the connection:</span></p>
    <p><span style="color:#000000;background-color:#ffffff;"></span><span
        style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;"><span
            style="font-family:monospace"></span></span>$ </span><span
        style="font-family:monospace"><span
          style="font-family:monospace"><span
            style="color:#000000;background-color:#ffffff;">nbd-client
            -l localhost -certfile
            /etc/nbd-server/certificates/client.cert.</span><br>
          pem -keyfile /etc/nbd-server/certificates/client.key.pem
          -cacertfile /etc/nbd-server/certificates/ca.cert.pem -n<br>
        </span></span><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">Negotiation:
          ..
        </span><br>
        Error: Reading magic from server: Connection reset by peer
        <br>
        Exiting.<br>
      </span></p>
    <p><span style="font-family:monospace"></span>Thereby, the server
      log says this:</p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">Jul 16
          14:21:28 mini systemd[1]: Started LSB: Network Block Device
          server.
        </span><br>
        Jul 16 14:21:30 mini nbd_server[26099]: Spawned a child process
        <br>
        Jul 16 14:21:30 mini nbd_server[26099]: Child exited with 1<br>
      </span></p>
    <p>Not that informative... Can someone of you spot the problem in my
      configuration?</p>
    <p>Remarks: If I set force_tls = False and do not use the
      certificates with nbd-client, it works fine. However, I need TLS
      encryption for my use case.<br>
    </p>
    <p>Thank you and kind regards,<br>
      Turakar<br>
      <span style="font-family:monospace"><span
          style="font-family:monospace"></span></span></p>
  </body>
</html>

--------------eUgeNPCqyFugrA7iBZvVE8S4--

