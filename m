Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F0130466
	for <lists+nbd@lfdr.de>; Sat,  4 Jan 2020 21:36:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DE31320662; Sat,  4 Jan 2020 20:36:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jan  4 20:36:08 2020
Old-Return-Path: <jelezarov.vladimir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 70BF12062B
	for <lists-other-nbd@bendel.debian.org>; Sat,  4 Jan 2020 20:20:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.199 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	HTML_MESSAGE=2, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pyeBGQmtqOlW for <lists-other-nbd@bendel.debian.org>;
	Sat,  4 Jan 2020 20:20:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 40DDB205E7
	for <nbd@other.debian.org>; Sat,  4 Jan 2020 20:20:44 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z3so45524861wru.3
        for <nbd@other.debian.org>; Sat, 04 Jan 2020 12:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:autocrypt:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=DYJFu4fy6faSptlsmaROuc7hX8sXLvGsJNngfQ/kF1k=;
        b=TeJXT3y/yeqb8X3A3YgSRCBFzTN2TK8BttUpHay2MYqicpoWSJqbhHMrEP5WJgcHww
         aVkLh7gUojLySCvFAOwJ/ZQS3iE5IrBeVQeMOXiZoKTk/WjIm3AZBxWwLAltcGXFbB48
         /zzN3Oul+whRaMLjbRp9RUSCtMGyAL34yk5bSWdxRFWeqal+U6kqMzdd0wWaX8HD1VTS
         DjZ1GRh3NRI8myWbmNxrOAprh/nkIYvD/e7mjHUAWZKLkOSpJ2AihLNzCc1KDOyWo6JH
         62nhHx7E8dk1FpumyiUASIUSP5U+WeWBkDFmlVNJDkuD/paKhsCrbtxxc2JJ0P9t3pIT
         WXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:content-language;
        bh=DYJFu4fy6faSptlsmaROuc7hX8sXLvGsJNngfQ/kF1k=;
        b=Q3b6X2IfFmkh6VlzTxEyOUuqM0/daW7FXzGJWd6M++wx5H+5UOGb7GnUzUz0O0JSbF
         R2SNJJFH2DG1/UeYDx6D9vumlRw57hHhsqMFYqO2flGVPfTe8fXD3kbZJDH7d11LlR8G
         NmXxj+PuOfuwBjvM7XqWdzmVwZzk+plafnZY8ooQpvT7aiEGuUmE94ilpAXYext1/RB6
         adKvVIfCxK0hIatI+tetFriIhWDsViZ5/G3Qgt1dOeXMO2OlO+bDdy+swEpy5OTqhZCo
         T+kVvFxhh4j2SzExVXPFX2z21fJ4SOtDc7MyzKN+7LQA6ZTMQC00uoiyk9k6xjOwYt8P
         CfPw==
X-Gm-Message-State: APjAAAVsrejkzPraXa+40PzW3iNWcZ2W7ohZqZOhsALliHOh1F0qSjz6
	Za8w9FIUG3uJHUg3mBrBSf05h9zr
X-Google-Smtp-Source: APXvYqz35Q0Wv3Lsy/jWSwvFfaphO60Vs+1NvlskqX6qLnSHo9cfaSlb7SL0EndKqxtAvFj7A5RYhg==
X-Received: by 2002:adf:e6c6:: with SMTP id y6mr94994892wrm.284.1578169241610;
        Sat, 04 Jan 2020 12:20:41 -0800 (PST)
Received: from [172.28.28.18] (ip1f1234d3.dynamic.kabel-deutschland.de. [31.18.52.211])
        by smtp.gmail.com with ESMTPSA id t1sm17027162wma.43.2020.01.04.12.20.40
        for <nbd@other.debian.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2020 12:20:41 -0800 (PST)
To: nbd@other.debian.org
From: Vladimir Zhelezarov <jelezarov.vladimir@gmail.com>
Autocrypt: addr=jelezarov.vladimir@gmail.com; keydata=
 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
 xvXz5RKl
X-Enigmail-Draft-Status: N11101
Subject: Is there a limit on the count of the exported devices?
Message-ID: <8ceb098b-7a80-03be-64cf-7d8def8f6907@gmail.com>
Date: Sat, 4 Jan 2020 21:20:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------584CDB85A308B6DDFE00334A"
Content-Language: en-US
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uLGTTRHHxeB.A.iyE.4cPEeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/766
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/8ceb098b-7a80-03be-64cf-7d8def8f6907@gmail.com
Resent-Date: Sat,  4 Jan 2020 20:36:08 +0000 (UTC)

This is a multi-part message in MIME format.
--------------584CDB85A308B6DDFE00334A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

independent of the size of the combined block device, I am unable to use
more than 1018 devices with the "-m" option in nbd-server. So for example=
:


    for i in {0..1999}; do truncate -s 1M mm.$i; done
    sudo nbd-server -C /dev/null localhost@33333 -m /home/user/nbd/mm
    sudo nbd-client localhost 33333 /dev/nbd0


Then it says:

    Negotiation: ..size =3D 1018MB
    bs=3D1024, sz=3D1067450368 bytes

which can also be confirmed by mounting /dev/nbd0.


Another example with 5000 files of 500K gives:

    Negotiation: ..size =3D 497MB
    bs=3D1024, sz=3D521216000 bytes

which gives the same 521216000/1024/500 =3D 1018 used files.


The same happens when using different sizes or combinations of sizes and
file-counts. I am using nbd 3.20 on x64 Ubuntu 18.04. Using a
configuration file makes no difference. Different hardware with the same
OS and nbd version neither.


Can someone give me some pointers?


Vladimir


--------------584CDB85A308B6DDFE00334A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>independent of the size of the combined block device, I am unable
      to use more than 1018 devices with the "-m" option in nbd-server.
      So for example:</p>
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
      Using a configuration file makes no difference. Different hardware
      with the same OS and nbd version neither.<br>
    </p>
    <p><br>
    </p>
    <p>Can someone give me some pointers?</p>
    <p><br>
    </p>
    <p>Vladimir<br>
    </p>
  </body>
</html>

--------------584CDB85A308B6DDFE00334A--

