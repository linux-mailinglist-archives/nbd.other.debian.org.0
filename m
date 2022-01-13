Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB8048D2E4
	for <lists+nbd@lfdr.de>; Thu, 13 Jan 2022 08:34:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6F14B2063D; Thu, 13 Jan 2022 07:34:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 13 07:34:34 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D5FD520637
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jan 2022 07:34:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id K2v3bK0G3p65 for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jan 2022 07:34:17 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wr1-x42a.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9402F20636
	for <nbd@other.debian.org>; Thu, 13 Jan 2022 07:34:16 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k18so8409361wrg.11
        for <nbd@other.debian.org>; Wed, 12 Jan 2022 23:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+zgsfHSi9KCO4GfieWD6GDbdWmAhDHXVhOy0B9Cl3Cg=;
        b=c1snITwjL7NzpAj/mX2PUbiW+XgGH6StTstAMygVfNjMyJAc4FanKBNiuCuhVMEwX5
         wnkhXoTyJEp4IFTgwF1Z7iEEeoCXGfTfWik+7hEbS5xoLuHtYSQHZno0vs0r1tK+OdSW
         TbjvucM9eiv5aZa2UGf2YfLf1s7b+DWZMRJCSE4knoUm8FNxqdX5z+fIl7/CeQyUxxQY
         cb65MqXfwUkUQ7iwDWRy+GRlBQPQz/G8xgFX0wUWKtDLqBSoX24X4QaSdVP3TShzNKeL
         VQYngeVZYsXpiI1qobU0/nUdndEt6nVoBXbV/zlfwVZ6043utz8pdHcr5J6CmIlQNn6E
         H0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+zgsfHSi9KCO4GfieWD6GDbdWmAhDHXVhOy0B9Cl3Cg=;
        b=SpEY9O4yN7I6EKlc65F4zKv8buDYY6EFZ/e9pooHmlyJAJPVEXES4kCzDoTObu4225
         /m5N0v8HDY2rz8zZRnPbJ5/Qz/+ECphhYlC1wlfIW7k4G+iwr/9XDEqeCeQNdM4RsGJm
         PDMqJ9O/HtMMrIqwNK+UuWZ3nEETOoT59Mqd3VE5+h6kypIKU6tHqPXcp/5oWNZVSXRW
         z1kTIGgef4/IbJIk5r8tcI/E+qwvdjus7bXqn370Acr/LZdNGgw0ZcABB3B3NoOAewzE
         oDyEUjNcMvwDnKTfXknU4Mh7sRBuw37rEgCsqc7ICzhEARXsLKLi5s47Ak2Pbw0eLdJN
         1ksg==
X-Gm-Message-State: AOAM5312104Dug5rZLo3r+Nr/I/sh1kJYgpYbQOsJ9+iTlf9K0Zklxra
	IvnC0sxgbhWK7237zRBsaFTkdj1r+izbpHbr
X-Google-Smtp-Source: ABdhPJyTiKkJetR/OykxMnA9o7fHbzLNgnxh1f6q+qXDqMvxdVkB3gS8V/QMrNvDJxVOZWcAj8LKqw==
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr2888026wrs.604.1642059254148;
        Wed, 12 Jan 2022 23:34:14 -0800 (PST)
Received: from localhost.localdomain (p200300d99704790072586cbefa5b7408.dip0.t-ipconnect.de. [2003:d9:9704:7900:7258:6cbe:fa5b:7408])
        by smtp.googlemail.com with ESMTPSA id t7sm1740662wrx.48.2022.01.12.23.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 23:34:13 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Manfred Spraul <manfred@colorfullife.com>
Subject: [PATCH 0/7] Add data to datalog, add replay tool
Date: Thu, 13 Jan 2022 08:34:00 +0100
Message-Id: <20220113073407.4742-1-manfred@colorfullife.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JbaAXPsUjCO.A.6jE.KY93hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1675
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220113073407.4742-1-manfred@colorfullife.com
Resent-Date: Thu, 13 Jan 2022 07:34:34 +0000 (UTC)

Hi,

As announced, here is the initial series for adding a replay tool.

Patch 1: Add support for pretty-printing WRITE_ZEROS and TRIM to
        nbd-trdump. I've added a 'static inline' helper function to a
        new header file.
	Is the approacch good? As alternative, I could add the function
	to e.g. cliserv.{c,h}. Would that be preferred?

Patch 2: Add actual data logging to nbd-server
	I've defined a new flag to indicate that actual data will follow.
	Any better ideas?

Patch 3: Add locking.
	Is sem_open() portable enough? Should I add a few fallbacks?

Patch 4: Add logging of the replies to nbd-server.

Patch 5: Add a new tool nbd-trplay
	Did I update Makefile.am correctly?

Patch 6: Initial CLI.
Patch 7: Actual implementation.

I've used the code a bit, and it seems that it finds at least
one suspicious case with ext4:
https://lore.kernel.org/all/baa3101d-e2f7-823e-040f-8739ab610419@colorfullife.com/

--
	Manfred

