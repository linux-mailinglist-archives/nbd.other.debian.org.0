Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id ED10A577163
	for <lists+nbd@lfdr.de>; Sat, 16 Jul 2022 22:29:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B026820491; Sat, 16 Jul 2022 20:29:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jul 16 20:29:58 2022
Old-Return-Path: <turakar23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,LDOSUBSCRIBER,LDO_WHITELIST,MONEY,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D984C2045D
	for <lists-other-nbd@bendel.debian.org>; Sat, 16 Jul 2022 20:29:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.96 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	LDO_WHITELIST=-5, MONEY=0.5, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fvHP8z_n0EUP for <lists-other-nbd@bendel.debian.org>;
	Sat, 16 Jul 2022 20:29:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 538A020458
	for <nbd@other.debian.org>; Sat, 16 Jul 2022 20:29:46 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id bk26so11483327wrb.11
        for <nbd@other.debian.org>; Sat, 16 Jul 2022 13:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to;
        bh=wnQ5k32CAmEzyGTawwnvtj6NLI2HhFXRtHpl2uveqiw=;
        b=VHuOcIoQHNPqOlMNkKrjN+rIWFjZ6N52cJp8bywBnZrc9M05JL/gV5UqdxzzYuv8de
         R/cbcktTQUV2OX9S7z87mpEJVQ24E87TO4sEp6gUUUJ9icUPBuETz2TTsrvvEwoDdjVs
         MwXcJ9iiPh1MXQZ5hWlo0zASBUCa/z1D1Tjwk/qfnvw0vLcDwbQhtabBsKMnWh0niDNz
         SLGMX7O4rD1uqJ5R+Ev0ZoMhsZXuWKPhIQtnBk/U5XvC6D213fi/ygS8W6R0/tZolgFo
         tXeWw5mdXH/VjCEdhFergPNcwQJuEOyAHzH0vaI1k6BjYl09UjRsg5yW5LY0afruIwSZ
         qo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to;
        bh=wnQ5k32CAmEzyGTawwnvtj6NLI2HhFXRtHpl2uveqiw=;
        b=CSeZrIuJSC8jApbK8IvxDnJYXulAz1LQFzuZKDimyhPUweVh8G6HkA6CA5m/FZwsrX
         X1SmF1xPDS603vihC2yRR1p6ooiHND9Fct7vYwOm2lH6BVx4sDX0+/576bj2svTEYjBf
         wVLsicOEkM7HwvIVev3NQvDKbfrtFEXOtve98Aq+FLzH47Ay+ppf8DfwrW97x2Ymg/gf
         /G80s+xfYh0kXSL0/AeI1db4P670q3sWZ1GgERUrAhRfXYkVVzW+Di1klTR3NlhWtaQt
         geiU0GORxkiacdQKhHlzWOPqOJSJHp6BscdHiml+s752fg9ofid1pE5cXznwoOkS8wH+
         F0rw==
X-Gm-Message-State: AJIora85kE27SLSgblBhqgR8TYucxb70EUq5czPTMSnh0/EVXcxKICS/
	sXk/ZKpOSzNfGlLM94xvY1q373bcC7lZ2YvyYBs=
X-Google-Smtp-Source: AGRyM1vABTc/vz+jpmKV8kRl1R8zANKs6jcLGuJzTiNKg2elxM5M5X7r2C/FxI30Yw/+b5lxWBy4Hg==
X-Received: by 2002:a5d:414b:0:b0:21d:6e93:59c8 with SMTP id c11-20020a5d414b000000b0021d6e9359c8mr17801692wrq.290.1658003383416;
        Sat, 16 Jul 2022 13:29:43 -0700 (PDT)
Received: from [172.16.0.54] (p578c5cab.dip0.t-ipconnect.de. [87.140.92.171])
        by smtp.gmail.com with ESMTPSA id f2-20020a1c6a02000000b003a2e89d1fb5sm12996764wmc.42.2022.07.16.13.29.42
        for <nbd@other.debian.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Jul 2022 13:29:42 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Wyxk4emXsNJBA2WzQ8BFPETg"
Message-ID: <0540e6c2-57c0-5c06-08e8-69be5b350201@gmail.com>
Date: Sat, 16 Jul 2022 22:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Setup NBD with TLS
Content-Language: en-US
From: Turakar <turakar23@gmail.com>
To: nbd@other.debian.org
References: <618b6ab5-e275-6573-e00d-aa62019089bb@gmail.com>
In-Reply-To: <618b6ab5-e275-6573-e00d-aa62019089bb@gmail.com>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DqKsgEfLAkN.A.w3.G_x0iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2190
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0540e6c2-57c0-5c06-08e8-69be5b350201@gmail.com
Resent-Date: Sat, 16 Jul 2022 20:29:58 +0000 (UTC)

This is a multi-part message in MIME format.
--------------Wyxk4emXsNJBA2WzQ8BFPETg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

An addition: A similar error occurs if only use encryption and no 
authentication:

$ nbd-client localhost /dev/nbd1 -N export -n -x
Negotiation: ..Error: Read failed: Connection reset by peer
E: received invalid negotiation magic 11567081237618425856 (expected 
1100100111001001)

On 16/07/2022 14:40, Turakar wrote:
>
> Hello,
>
> I am currently trying to setup nbd-server/nbd-client with TLS 
> authentication, but I ran into some difficult error messages. If this 
> is the wrong list for support, please feel free to redirect me.
>
> I use one system (Debian 10) for both nbd-server and nbd-client for 
> debugging, but want to move to separate hosts later. I used the 
> following nbd-server config file:
>
> [generic]
>        user = root
>        group = root
>        includedir = /etc/nbd-server/conf.d
>
>        allowlist = true
>
> # TLS setup
>        force_tls = true
>        cacertfile = /etc/nbd-server/certificates/ca.cert.pem
>        certfile = /etc/nbd-server/certificates/server.cert.pem
>        keyfile = /etc/nbd-server/certificates/server.key.pem
>
> [export]
>        exportname = /dev/system/nixos
>        flush = true
>
> I created the certificates as follows:
>
> $ openssl genrsa -des3 -out ca.key 4096
> $ openssl req -new -x509 -days 36500 -key ca.key -out ca.cert.pem
> $ openssl genrsa -out server.key 4096
> $ openssl req -new -key server.key -out server.csr
> $ openssl x509 -req -days 36500 -in server.csr -CA ca.cert.pem -CAkey 
> ca.key -CAcreateserial -out server.crt
> $ openssl genrsa -out client.key.pem 4096
> $ openssl req -new -key -client.key.pem -out client.csr
> $ openssl x509 -req -in client.csr -CA ca.cert.pem -CAkey ca.key 
> -CAcreateserial -days 36500 -sha512 -out clien
> t.cert.pem
>
> And use the following command for testing the connection:
>
> $ nbd-client -l localhost -certfile 
> /etc/nbd-server/certificates/client.cert.
> pem -keyfile /etc/nbd-server/certificates/client.key.pem -cacertfile 
> /etc/nbd-server/certificates/ca.cert.pem -n
> Negotiation: ..
> Error: Reading magic from server: Connection reset by peer
> Exiting.
>
> Thereby, the server log says this:
>
> Jul 16 14:21:28 mini systemd[1]: Started LSB: Network Block Device 
> server.
> Jul 16 14:21:30 mini nbd_server[26099]: Spawned a child process
> Jul 16 14:21:30 mini nbd_server[26099]: Child exited with 1
>
> Not that informative... Can someone of you spot the problem in my 
> configuration?
>
> Remarks: If I set force_tls = False and do not use the certificates 
> with nbd-client, it works fine. However, I need TLS encryption for my 
> use case.
>
> Thank you and kind regards,
> Turakar
>
--------------Wyxk4emXsNJBA2WzQ8BFPETg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>An addition: A similar error occurs if only use encryption and no
      authentication:</p>
    <p><font face="monospace">$ </font><span
        style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">nbd-client
          localhost /dev/nbd1 -N export -n -x
        </span><br>
        Negotiation: ..Error: Read failed: Connection reset by peer
        <br>
        E: received invalid negotiation magic 11567081237618425856
        (expected 1100100111001001)<br>
      </span></p>
    <div class="moz-cite-prefix">On 16/07/2022 14:40, Turakar wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:618b6ab5-e275-6573-e00d-aa62019089bb@gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
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
                 user = root <br>
                 group = root <br>
                 includedir = /etc/nbd-server/conf.d <br>
          <br>
                 allowlist = true <br>
          <br>
          # TLS setup <br>
                 force_tls = true <br>
                 cacertfile = /etc/nbd-server/certificates/ca.cert.pem <br>
                 certfile = /etc/nbd-server/certificates/server.cert.pem
          <br>
                 keyfile = /etc/nbd-server/certificates/server.key.pem <br>
          <br>
          [export] <br>
                 exportname = /dev/system/nixos <br>
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
      <p><span style="color:#000000;background-color:#ffffff;">And use
          the following command for testing the connection:</span></p>
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
            .. </span><br>
          Error: Reading magic from server: Connection reset by peer <br>
          Exiting.<br>
        </span></p>
      <p><span style="font-family:monospace"></span>Thereby, the server
        log says this:</p>
      <p><span style="font-family:monospace"><span
            style="color:#000000;background-color:#ffffff;">Jul 16
            14:21:28 mini systemd[1]: Started LSB: Network Block Device
            server. </span><br>
          Jul 16 14:21:30 mini nbd_server[26099]: Spawned a child
          process <br>
          Jul 16 14:21:30 mini nbd_server[26099]: Child exited with 1<br>
        </span></p>
      <p>Not that informative... Can someone of you spot the problem in
        my configuration?</p>
      <p>Remarks: If I set force_tls = False and do not use the
        certificates with nbd-client, it works fine. However, I need TLS
        encryption for my use case.<br>
      </p>
      <p>Thank you and kind regards,<br>
        Turakar<br>
        <span style="font-family:monospace"><span
            style="font-family:monospace"></span></span></p>
    </blockquote>
  </body>
</html>

--------------Wyxk4emXsNJBA2WzQ8BFPETg--

