Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4D64D107B
	for <lists+nbd@lfdr.de>; Tue,  8 Mar 2022 07:50:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 65E49202A2; Tue,  8 Mar 2022 06:50:07 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  8 06:50:07 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5847B2029F
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Mar 2022 06:49:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UCizc1HjtWKi for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Mar 2022 06:49:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wm1-x32b.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DB05920280
	for <nbd@other.debian.org>; Tue,  8 Mar 2022 06:49:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id k29-20020a05600c1c9d00b003817fdc0f00so823065wms.4
        for <nbd@other.debian.org>; Mon, 07 Mar 2022 22:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DGosRawi8R9mnQ/jZQ8MRxPG9q505PuDgQm26PAB4vs=;
        b=LF6PtwWjPnpjnkyMxfRRXsC5Q8mA1+6sJbO7KUpLC8SzIWbGpebobU0wcLBAWJxNRG
         +Hz3krDhvOxTG8x0m8CXvQ3YdBs/1OitoD4++vsg4Yd6tvBgRZ2ANsgeb4HSmwyC1lda
         cGflD1SEyoRve3BP3mdsDTMIMcOS4pCwV6P/l5qMWmXG5rDST2Hp00PYdbMFcanYLbNQ
         RWzKEAUaXe5yy0oxYJYcmVLjCGftAMCK2JmhpnJDji18WiFDDsc9sLUq6SG3yXftvYN9
         VWu25uk7dYjQlQTpyP95aWd0fo/zAP7+4BOWO8tJnevRQkOUHk2qIrbwRcRLKBuwxi6f
         yksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DGosRawi8R9mnQ/jZQ8MRxPG9q505PuDgQm26PAB4vs=;
        b=fZc/7P6j9l+1nXHl+ow0WOBamaRloah4S1rrxbjxj/U3pG6Vw7DUXxWxBaVKjmTikG
         SzDr2bKhmqsy0pwdReCJmF6emgPJ7FhOqI0SnTDdSseuJbILTzniKdYQpb4BVS2RSmcQ
         0n2yiOhf+m+wFPHwb7rQimxmHSPFIAACv+X0ahftbLZDQxrTToQqtLepu4YHs8yMPyVX
         09S8c/SNwQnqTdTjxK1AjkEzy5UjZBmoMgx3bybPWDVU0BfauRTX7j2+YREpxwopacMW
         LgKsgitZZwCoe45MSaCZvy1UVzEIb36cdo1Tt4CMjp9c5oyMr7jpLyM2PuqW6Loe6r/n
         Eijw==
X-Gm-Message-State: AOAM532Hi5+/3aGiHnkTO6esr/ef80sbhzz2cpgra6uisdiaQkrB5duw
	bBo9i4zsUTLLiiaaKBww6BO+PEOD2b6kxw==
X-Google-Smtp-Source: ABdhPJzzJ+FNwzocDltxwodHQBVKDu5/+Hbu5q6ep7cvKV1CnXqqnPB5SJoSwMEo2oCgCCWA9lPhwA==
X-Received: by 2002:a05:600c:4fd6:b0:352:c2c6:8f34 with SMTP id o22-20020a05600c4fd600b00352c2c68f34mr2233324wmq.186.1646722190585;
        Mon, 07 Mar 2022 22:49:50 -0800 (PST)
Received: from localhost.localdomain (p200300d997090400ceff79f607526619.dip0.t-ipconnect.de. [2003:d9:9709:400:ceff:79f6:752:6619])
        by smtp.googlemail.com with ESMTPSA id f4-20020a5d4dc4000000b001d8e67e5214sm13092364wru.48.2022.03.07.22.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 22:49:50 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>,
	Manfred Spraul <manfred@colorfullife.com>
Subject: [PATCH 0/2] nbd-trplay,nbd-trdump updates
Date: Tue,  8 Mar 2022 07:49:42 +0100
Message-Id: <20220308064944.12439-1-manfred@colorfullife.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vPvFURX_BSI.A.vAH.fyvJiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1727
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220308064944.12439-1-manfred@colorfullife.com
Resent-Date: Tue,  8 Mar 2022 06:50:07 +0000 (UTC)

Hi,

Patch 1: The discussed printf update, and a correction
         of an incorrect printf.

Patch 2: Test case for nbd-trplay.
	I did not understand how tests are automatically started,
	thus I'm not sure if I added the new test correctly.

--
	Manfred

