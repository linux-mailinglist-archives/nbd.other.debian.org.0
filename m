Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 306443E2B75
	for <lists+nbd@lfdr.de>; Fri,  6 Aug 2021 15:36:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F1B5A205DD; Fri,  6 Aug 2021 13:36:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug  6 13:36:12 2021
Old-Return-Path: <conatcboite2021@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E28B6205D4
	for <lists-other-nbd@bendel.debian.org>; Fri,  6 Aug 2021 13:20:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.949 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uTG2qLdGP1Vl for <lists-other-nbd@bendel.debian.org>;
	Fri,  6 Aug 2021 13:20:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 40B6E205C6
	for <nbd@other.debian.org>; Fri,  6 Aug 2021 13:20:32 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id n6so11870530ljp.9
        for <nbd@other.debian.org>; Fri, 06 Aug 2021 06:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=lR/58DykDQ0QqK2HcxJA2o+sYpYNCKTf3/Hm+spZn4s=;
        b=Fy1BD3+2zHoR5t5wFYCBzO+3AISscrcXn0FMoTLb5Y+O17A0rWb7LDrFnH66p2tmSv
         tovOVuf2o5agN063XVjzq/untBs2vYbQ4W33dWQ5y/NSjdfjkW2aY6eX6C07ULcTkiUA
         SzIbr5CKgubFu74MoVmorMFYwWeAQqQqLBkfnywkGBj2e0FtME1buwCLbnvkTg8h4Og/
         5K9QndAsH5ybctRcImjrVIKKENgE1A4JZAd5ZunmIsRH2gg1fAlksPtQot95vnmvqIK4
         CJh0eX0w4VY54l9DB9/ryyW6amJFDSEk39+U3w5hPO14M/y2mkgCtKXOevjRd6KBmH52
         8W5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=lR/58DykDQ0QqK2HcxJA2o+sYpYNCKTf3/Hm+spZn4s=;
        b=SjSVr/QbqUupNUOERivf5JFT9P/hc7Vq+kJScA5auOWCujp5nGwhleWaapERVZcVFy
         kqyofIJAB4jsKWoa08GgqdiCv7/TAqHPDSEXgwDBc4NVvPjxQi+6RMkWMbEsQrESMJZr
         ZO7713I+71O73hXBXlXiNt6aNxABbutH7VdLza0B8JQo+G0vG4Ld0V9h4xc1JHZihf+o
         KZR8NEV+4AZlVswVChiOFmDueKreK3hWJ/mcAjvJDkjqA6aCed1VyItN4FTP00nO70Zw
         RzauJj+sUzpbSKVqbNtDjb402Juu3g0um8qoG8zv9BgNrebs6cOF3r0m/EOiMl4MBnPQ
         i3JQ==
X-Gm-Message-State: AOAM531suYLlOs0EyvvnS+BP3C5ZevnsCb7Jadp9TLeKDP2RoPllZ26W
	6LHWkFYhNvvxIgriK0UtYQ+AXQ++ZVS+WGS136Mgw0RXXlk=
X-Google-Smtp-Source: ABdhPJxLGpjLfAZGFp4h/PGNSS+l4NV1ANiiu6AJ4JLSx98MoX3Qq8je85e3fiHnLNBZ/iH2X/2BDckt4Jmduy+W4Ko=
X-Received: by 2002:a2e:a793:: with SMTP id c19mr6633596ljf.426.1628256029423;
 Fri, 06 Aug 2021 06:20:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9a:49cb:0:b029:11e:dbe8:2156 with HTTP; Fri, 6 Aug 2021
 06:20:29 -0700 (PDT)
From: CONTACT ROLE <conatcboite2021@gmail.com>
Date: Fri, 6 Aug 2021 14:20:29 +0100
Message-ID: <CA+Kdv2U+7HL++hecQDA_Ga-ViTJ8QjTUBJ2esPXKQx4figV3DA@mail.gmail.com>
Subject: Looking for a new opportunity
To: nbd@other.debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6KgyVUCXkvB.A.2SC.MrTDhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1241
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CA+Kdv2U+7HL++hecQDA_Ga-ViTJ8QjTUBJ2esPXKQx4figV3DA@mail.gmail.com
Resent-Date: Fri,  6 Aug 2021 13:36:12 +0000 (UTC)

Hello,

I hope things have been awesome!

I=E2=80=99m jotting you a quick note to let you know that I=E2=80=99m curre=
ntly
searching for a new career opportunity in Computing Network.
For a greater understanding of my professional qualifications, you can
find my resume attached to this email.
If you hear of anything within your own network that you think might
fit the bill, I=E2=80=99d so appreciate if you could send a heads up my way=
.
Let me know if I can ever return the favor. I=E2=80=99m happy to do so!

Thanks,

