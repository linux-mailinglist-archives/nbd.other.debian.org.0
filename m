Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 023B747B199
	for <lists+nbd@lfdr.de>; Mon, 20 Dec 2021 17:48:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C038F20250; Mon, 20 Dec 2021 16:48:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Dec 20 16:48:53 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 6954320214
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 Dec 2021 16:48:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vPdojBWtOX_h for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 Dec 2021 16:48:39 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wr1-x429.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B35A72020D
	for <nbd@other.debian.org>; Mon, 20 Dec 2021 16:48:39 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j18so21419281wrd.2
        for <nbd@other.debian.org>; Mon, 20 Dec 2021 08:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject:content-transfer-encoding;
        bh=fZ1XWQ47Q6QJCTSZifyJL1RZYr7T0Kq8utgPRB2vlo0=;
        b=7bkFNoBFb1gV7vJuB0Is3jIpIqQqkAkbVwP9pddbdRq8Y4Cwrl9kPjogtaZc4aTX63
         UqZ8R4oJh71BFMk0zR8pT2SZIOIuSOvlkv/uHErIN0EhgQ9UGCrRi/Y6OTuzT05IwZil
         YiTfY1s8R7UnSlx/X1Zi1nvhyj/tmWfaRXX1sMuARG0DpVNk6yG1KApwPK6r1xuokbtv
         7GbLEW8mxAAg9dFeqvUzMTh6wek8CN1byY20yfFdHd2iLKEzjH6t9BmckrH01ugdcZn8
         beb9lafuFwU2IhnNVhPTo4TDHXpXZRVTLIAZ5IkPNLlAeBc3jWAwpjvd1MnOP1hvEprG
         0M5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject:content-transfer-encoding;
        bh=fZ1XWQ47Q6QJCTSZifyJL1RZYr7T0Kq8utgPRB2vlo0=;
        b=BV7AR4Ckoc0yj4lopR/QoI7FTWjurRdDbEfsgpSEXv/ZnFoVjkM8QcAG4EWHPVJ1n8
         5fqe/1P0rZrjVTW/yqoFOdj18XDTylylZXbinijL4H5DRHtgj8Rxiw3kdpcJQ5yEIzo7
         4PX7c3s36EL4wdi7FQu3glWHgVZZSnbEuILw19nH16wAc09E1+exBeAhxqARHKHFoKaF
         p2+x5y2jEP+uJcMHb4oPVaaz3YCn1w9zfpD9jhT1HEImcNGuwd07NK3LRwQpS8xcXoWj
         vGgCrSZkc+60SmaXJPKoZx32rIhbPwX3YEJvFXVYWTYufZ8ZtvryKZ7pIcp5+s0MmWne
         xYxg==
X-Gm-Message-State: AOAM532EBThEKvT4tUPCD+90BzXDz2DI2s19aHem+F9rRh0EyKu7ClHK
	GmITsL2CeSVj19GYK0a4If5K0L6WkT/pLQ==
X-Google-Smtp-Source: ABdhPJyg2Bq2vSGcKfGMO5bUi46e5VYJt8tdzVELli7qZvJLeCc/Kju1yH2gfj0weFH9WVN9OvtXvg==
X-Received: by 2002:a5d:5552:: with SMTP id g18mr13765243wrw.488.1640018916966;
        Mon, 20 Dec 2021 08:48:36 -0800 (PST)
Received: from ?IPV6:2003:d9:9703:7800:841f:7f15:f3f9:58e8? (p200300d997037800841f7f15f3f958e8.dip0.t-ipconnect.de. [2003:d9:9703:7800:841f:7f15:f3f9:58e8])
        by smtp.googlemail.com with ESMTPSA id b16sm8501538wmq.41.2021.12.20.08.48.36
        for <nbd@other.debian.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 08:48:36 -0800 (PST)
Message-ID: <fe55642d-be5c-5800-88a2-6fb13c2d2004@colorfullife.com>
Date: Mon, 20 Dec 2021 17:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: nbd@other.debian.org
Content-Language: en-US
From: Manfred Spraul <manfred@colorfullife.com>
Subject: datalog including written data?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <r4jBTiEvNZK.A.w9E.1PLwhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1660
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/fe55642d-be5c-5800-88a2-6fb13c2d2004@colorfullife.com
Resent-Date: Mon, 20 Dec 2021 16:48:53 +0000 (UTC)

Hello together,

for a stress test application, I would like to extend the datalog to 
include the actual written data.

The use case is to replay parts of the log, similar to what I wrote for 
a NAND driver a few years ago:

https://patchwork.ozlabs.org/project/linux-mtd/cover/20171206085039.27164-1-dirk.behme@de.bosch.com/

a) Has anyone done that before?

b) As first observation:

https://github.com/NetworkBlockDevice/nbd/blob/master/nbd-server.c#L294

The server supports

NBD_CMD_READ, NBD_CMD_WRITE, NBD_CMD_DISC, NBD_CMD_FLUSH, NBD_CMD_TRIM, 
NBD_CMD_WRITE_ZEROES

https://github.com/NetworkBlockDevice/nbd/blob/master/nbd-trdump.c#L71

The trace dump utility supports

NBD_CMD_READ, NBD_CMD_WRITE, NBD_CMD_DISC, NBD_CMD_FLUSH

-> TRIM and WRITE_ZEROES is missing.


Should I create a patch that adds TRIM and WRITE_ZEROES to nbd-trdump?


--

     Manfred

