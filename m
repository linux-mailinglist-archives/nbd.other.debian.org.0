Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 134D748EAAC
	for <lists+nbd@lfdr.de>; Fri, 14 Jan 2022 14:29:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B71F7204FA; Fri, 14 Jan 2022 13:29:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 14 13:29:40 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C4BB5204FB
	for <lists-other-nbd@bendel.debian.org>; Fri, 14 Jan 2022 13:29:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ztgIHeDuXtxe for <lists-other-nbd@bendel.debian.org>;
	Fri, 14 Jan 2022 13:29:29 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wr1-x42c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id ACFC9204F5
	for <nbd@other.debian.org>; Fri, 14 Jan 2022 13:29:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q8so15573041wra.12
        for <nbd@other.debian.org>; Fri, 14 Jan 2022 05:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2GNJuHsy7u3F46/qVjZBkPH9R/jHMVFS6VBcqGzUIX4=;
        b=bJS8zs1gjxPDB7XetR8aCtWQsGzGOZ5DjT4352UD1ucnuyzf6UEcMa7WlduvtoSV20
         dLU6tVmloolsU0BQmgbsSVy6z3XCwOOaAG629Yt8vFDmIZW6QHVClT3IWBwBoLPHbKPH
         dEnkLKQSpsHtsKn3+O3+5ZSKrAP81o0If03CSTP/OWca6nsh+/YFjNl+Mi2wMdjxSmeJ
         h0F3wNbM17OKKwzK2QJ+nBejZzV69ryIhgKHlG9Qqk/2ftGYFCPEu4YpPA6w3oysIa+z
         rtwAYxN8C4aBJRE/kxGF0H6phHpVyO1VlVBSl/VHFzyJgVOyBwOTVdTSKicklQ/YGwB7
         r9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2GNJuHsy7u3F46/qVjZBkPH9R/jHMVFS6VBcqGzUIX4=;
        b=KFORG1fI7xRxBWlyRkgrQ2xX8vWEWV+mbEr6Fnxa8RMlFnbXLEfsC6BMgJtI8CTHhv
         dwhuY9+nLyZMJUmv6ZfdBiYpKpaXHfP4BguBaOeBX2IthF5OPwmbtuWidFMX/gTgJp9r
         vyH/ME5ts3CNG033mqjzTUeHirKYFXAWvaOA19kk0pmkIIZ2rWGuB8GkWhk21ccP2jj9
         gWBC8Q5TcF/ydAObB0mUA9Df9lZN0pi7ilwCp0AZqYqW3g+D8vJdGXnS2aPv1bc8IFIb
         wU97GoamWw3ikWsfZvF6/muY6ER5XPdHKkAyz0fR6GTh2in5FvSHY+HUH09i9lotxeYr
         qsYg==
X-Gm-Message-State: AOAM532zLL7RxNU7E+4kbNZg602N9OEYsje7obbfCd7r4wqFbHZ4/fAB
	A8JOmvSg5wvbUxeUGxWsorS/BpKAqbBYrA==
X-Google-Smtp-Source: ABdhPJx8qrBYCcztkdAwZClllsdp3bLMhhuydb71mqwH2Y7lDr291wfiK0evGwMcZWYU9WQO9lTqNQ==
X-Received: by 2002:adf:fc45:: with SMTP id e5mr6591767wrs.248.1642166966566;
        Fri, 14 Jan 2022 05:29:26 -0800 (PST)
Received: from localhost.localdomain (p200300d997095700d6b9b73ae78d7d87.dip0.t-ipconnect.de. [2003:d9:9709:5700:d6b9:b73a:e78d:7d87])
        by smtp.googlemail.com with ESMTPSA id r132sm5711291wma.34.2022.01.14.05.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 05:29:25 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>,
	Eric Blake <eblake@redhat.com>,
	Manfred Spraul <manfred@colorfullife.com>
Subject: [PATCH 0/2] Add data to datalog, add replay tool, V02
Date: Fri, 14 Jan 2022 14:29:21 +0100
Message-Id: <20220114132923.15528-1-manfred@colorfullife.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mSlLAkHhjwJ.A.NuE.ErX4hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1686
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220114132923.15528-1-manfred@colorfullife.com
Resent-Date: Fri, 14 Jan 2022 13:29:40 +0000 (UTC)

Hi,

Updated series. For now, only 2 changes, I'll update the rest
after review.

Patch 1: Add support for pretty-printing WRITE_ZEROS and TRIM to
        nbd-trdump. I've added a 'static inline' helper function to a
        new header file.
Changes:
	- Support added for all commands mentioned in proto.md,
	  even the experimental commands.
	- use #param to reduce copy/paste.

Patch 2: Add actual data logging to nbd-server
	I've defined a new magic for a new request type to indicate
	the new contents of the log.

Changes:
	- Introduction of a new magic, and use that for a header
	  of the log file.

Questions:
	- Should I update proto.md and declare the magic as reserved?
	- I have reused the existing struct nbd_req. Is that ok, or
	  should I define a new structure with exactly the needed
	  fields?
	- Should nbd-trdump abort when it encounters an unknown
	  flag? I would say no: It is a development tool, thus
	  the human reader can/must interpret the output anyways.

--
	Manfred

