Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 280C45688AE
	for <lists+nbd@lfdr.de>; Wed,  6 Jul 2022 14:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6613D2047D; Wed,  6 Jul 2022 12:51:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul  6 12:51:09 2022
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	TO_TOO_MANY,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 19A5620449
	for <lists-other-nbd@bendel.debian.org>; Wed,  6 Jul 2022 12:34:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qvzuilL8hmzI for <lists-other-nbd@bendel.debian.org>;
	Wed,  6 Jul 2022 12:34:47 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x1031.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5222B20408
	for <nbd@other.debian.org>; Wed,  6 Jul 2022 12:34:44 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id j1-20020a17090aeb0100b001ef777a7befso6804395pjz.0
        for <nbd@other.debian.org>; Wed, 06 Jul 2022 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=hW2431492sCVZamN/p5cUoH7v2KxbwYiYFtMhbuxSSs=;
        b=aO/ZC+U5LATGWzsMenvtODpWhcejLQ4DmRLha/4SFn11Wf8DcIrFk1B5B3fP0AvXUg
         F1PUOqzt04jGHL+kW42wdhfxoatgfieaCaFTjTsg/0aPS0d1NSqzbVAWUr48FwKbi2kk
         bNQBektjLeeE1K2U1dLcbw68C5O909m3ltoYOt5psp5Gsf6ooUgQxbp7vtkJxaFCNVLq
         JB5JDSboVX7gNuCr6BqOEB2T1vnXsuL9FxkeVt6f0+RSoxgWygebchQshMWMnbZdv7Xg
         QtsTjaAJP4QGjnj40SClqvGtAh7oHGQx9EV2mY92w7wDa5vthlOb4om9GVvEhy9g8Ujc
         ZNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=hW2431492sCVZamN/p5cUoH7v2KxbwYiYFtMhbuxSSs=;
        b=y2Egd+3AR1DLIS41M7OZ3m5mIlMKopDOT4DKQji+0Gbdr+s2HanXc8dzjehOxJ4YA4
         VLBiYQXbHfaGAdtMLm8Xkbx1C463sAW99S/lmthVhQN4meiQX+S6Lm9wPdVIh8HFhRxR
         r3EkWZ/J3MxSUvFCnshnwDqbWYxY6qpmaj1avnYw0H3SPNo2l/6HXCBNWEng2SaWEg+Q
         cgnH58D56xzaBWG4fQ2856KKLey2ndVr8jXfQZO02Q7wDlJM98Z0VhNzMBAwrvr6rbB+
         K4qwA6TXRncbkOTkPTRCc+B4yS6kzfq8/QNtuBlZThJUSmbrOkAMmxb63qqnjj2H3SbI
         LS9g==
X-Gm-Message-State: AJIora+7KBFBOUUMzVG/y8Ed14fcPqtRoeMtYBeje3NZzHODqh6Fn/vV
	nOx40lQ4uTmKrYJCeKUFcOPbKA==
X-Google-Smtp-Source: AGRyM1szJSqnPFX6luEMhyzzQ0Aeywhddc3vVY3+ZKqUe4ppobSQfJg1kQYfqyNYWH89tB/Ll0NihQ==
X-Received: by 2002:a17:902:ab42:b0:16c:66d:c44d with SMTP id ij2-20020a170902ab4200b0016c066dc44dmr1314197plb.125.1657110880402;
        Wed, 06 Jul 2022 05:34:40 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 84-20020a621957000000b005289cade5b0sm2634560pfz.124.2022.07.06.05.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 05:34:39 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: jejb@linux.ibm.com, hare@suse.de, kartilak@cisco.com, Christoph Hellwig <hch@lst.de>, martin.petersen@oracle.com, satishkh@cisco.com, sebaddel@cisco.com, damien.lemoal@opensource.wdc.com, john.garry@huawei.com, bvanassche@acm.org
Cc: linux-nvme@lists.infradead.org, nbd@other.debian.org, linux-scsi@vger.kernel.org, linux-s390@vger.kernel.org, linux-block@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com, linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <1657109034-206040-1-git-send-email-john.garry@huawei.com>
References: <1657109034-206040-1-git-send-email-john.garry@huawei.com>
Subject: Re: [PATCH v3 0/6] blk-mq: Add a flag for reserved requests series
Message-Id: <165711087866.291548.18135186803736478100.b4-ty@kernel.dk>
Date: Wed, 06 Jul 2022 06:34:38 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IDc2zmbo_EJ.A.xL.9UYxiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2187
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/165711087866.291548.18135186803736478100.b4-ty@kernel.dk
Resent-Date: Wed,  6 Jul 2022 12:51:09 +0000 (UTC)

On Wed, 6 Jul 2022 20:03:48 +0800, John Garry wrote:
> Can you please consider this series? Thanks
> 

Applied, thanks!

[1/6] scsi: core: Remove reserved request time-out handling
      commit: deef1be18e3fc62ddf04fb3e5e8ff6a301693dcc
[2/6] blk-mq: Add a flag for reserved requests
      commit: 99e48cd6855e9535488e3c90d65edd46c6e6fc1b
[3/6] blk-mq: Drop blk_mq_ops.timeout 'reserved' arg
      commit: 9bdb4833dd399cbff82cc20893f52bdec66a9eca
[4/6] scsi: fnic: Drop reserved request handling
      commit: 1263c1929fb8c375494666ec6d1bac838ff02c25
[5/6] blk-mq: Drop 'reserved' arg of busy_tag_iter_fn
      commit: 2dd6532e9591f201e7571b30915db807603ab924
[6/6] blk-mq: Drop local variable for reserved tag
      commit: 4cf6e6c0106bf6e6d034fa6043b4428ac2f267fc

Best regards,
-- 
Jens Axboe


