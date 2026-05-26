Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKynHTPQFWrkcAcAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 26 May 2026 18:54:11 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0C15DA291
	for <lists+nbd@lfdr.de>; Tue, 26 May 2026 18:54:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6DBF3204E5; Tue, 26 May 2026 16:54:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 26 16:54:10 2026
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AD555205DA
	for <lists-other-nbd@bendel.debian.org>; Tue, 26 May 2026 16:37:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0GkEu67uC5HY for <lists-other-nbd@bendel.debian.org>;
	Tue, 26 May 2026 16:37:32 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-oa1-x35.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1BE2C205D0
	for <nbd@other.debian.org>; Tue, 26 May 2026 16:37:28 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-43587e63a8eso6808616fac.0
        for <nbd@other.debian.org>; Tue, 26 May 2026 09:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1779813445; x=1780418245; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbEyVDKYB6brZVOZVveRW94ChbWHXbhuaSGALUdMmOo=;
        b=q86u3ljvJTTJEumk2PKQ70DFLDIPlH4M8z/EeP4Zm/bHvJN3UbqU1zVt1V6rm1jEd6
         HghUj2mk5TBw5HrCrpq7d0qgweyqW6W2OZHGB3yxLLcWkHa5DvHl+A9Zp0kwmDMupNiH
         wxBf30PVeBVH6+Qf423rHXY8xXGyhaRw7CcecB/gFFpLb/MXD5xKiDtbd1RDCjKn3wpI
         Z8C5FjkylNtH0D7ejM9FRyhmGgW9+4Chr+3FgJdTbJSbrXf+XaNwN4iGRY9qw+rQ7N8g
         tZPhlx6kMeA/kI8mlZFvFHxjcMZ948gaPh+9dzrezafk04cRgrvkWAOZHfM3c5JGubY5
         Br8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779813445; x=1780418245;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CbEyVDKYB6brZVOZVveRW94ChbWHXbhuaSGALUdMmOo=;
        b=Jox5k1RLIkflAEcD2mEzjE5RRGBaDgbDFBME/reSSauJTmXZbW1ZNZ3FqoXMsh9zqm
         JFixVR7TbpD7SxrhMmsf78J+byEhSK2BCM7WBjYWcB07O0v57JGClYPhb4AIyMl55D9M
         pD9JHlUBE7EGJfNA68XfcBN0t8IoGz8XlVeQgVf5SytqGezuUOzK3a8rsFLKSN6/dtVJ
         dTjGshEG64oscSfDJaJ2Ff8VvUc2G+3DtllL5PSoFExIogfBy1UxGif56ziSRTJUOYWw
         LmAN5gOj6SFJieP0ECiwNGKmKLaoUM5gJEGMTiUF0BLPlPNmcVepJ4O1sarFka2EnGd9
         cb8g==
X-Forwarded-Encrypted: i=1; AFNElJ/famHmgO/PEggTasT62V0Cq9axFNmbYtm3KIog1Xxr79oVrNtSqsUXrlgObCvfJMSan6g=@other.debian.org
X-Gm-Message-State: AOJu0YxVMfN/RDr15qurEsVTyNeDQ/b0rHJfxWStuva5RndO/AGDZvIu
	PUFnTpxpJozOlOn+OSaU9arsNLv6+qADoKuCBgAIXs9VR9fyUIHGaWn7l/18HXPbBkU=
X-Gm-Gg: Acq92OEEgjZpeJiPga7MZdbLBJic69T6QMxyqj+FoCHb8Wv1IUo7YdYOkK+0GFqXzLj
	Dm93PTNnNg9fay9Skt5gkhQssZpWWaS6r7nG5bBiWu6gCR5qnx8C6yogKZatMw6/Gz9fVDpyCU6
	CYJ216/zuA1EAu94+yASWg+P0Gy+BFnvLZ6c4FNa00K+eIwUMKrGxTuUzMbQoZmlcLtVv28ab2R
	yU2JutmBGBzgOkUM/FpdS/eLH0m9YWmDp5In2YmSAqgHW4TlYVugDeJL2/pbtdlNc8HATpO+U5I
	LssMwitW2r6vfCdiVgu1vCu9jFrBkg8A3uMMWC3nY5XDL/P9AAxwCy7iMYXtErLMxcACeiEGDA8
	yEJCPhAOiyYiJ5UXiymngDbrWbgfHXi+3h5yV4pOIpnsuUeTFrfpqem64JRYyQDmw86LIMv+LEq
	k5rI63W0k4B2M+BtYDl75X7ujSjK+/vkIJcBPHDp073kRHI/sgiTy5WiUEIZkIE1KFCXN/O6rwI
	DOQhCompW4+aJkmYHnddwxq
X-Received: by 2002:a05:6871:289a:b0:43a:5cd0:db00 with SMTP id 586e51a60fabf-43b5adb7a25mr12258063fac.23.1779813444777;
        Tue, 26 May 2026 09:37:24 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b639fd7adsm13561265fac.14.2026.05.26.09.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:37:22 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Caleb Sander Mateos <csander@purestorage.com>, 
 Sung-woo Kim <iam@sung-woo.kim>, Josef Bacik <josef@toxicpanda.com>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Justin Tee <justin.tee@broadcom.com>, 
 Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
 Paul Ely <paul.ely@broadcom.com>, Chaitanya Kulkarni <kch@nvidia.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Thomas Fourier <fourier.thomas@gmail.com>, 
 Al Viro <viro@zeniv.linux.org.uk>, Luke Wang <ziniu.wang_1@nxp.com>, 
 Kees Cook <kees@kernel.org>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nbd@other.debian.org, 
 dm-devel@lists.linux.dev, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
 linux-scsi@vger.kernel.org
In-Reply-To: <20260523125210.272274-1-mateusz.nowicki@posteo.net>
References: <20260523125210.272274-1-mateusz.nowicki@posteo.net>
Subject: Re: [PATCH v1] block: switch numa_node to int in blk_mq_hw_ctx and
 init_request
Message-Id: <177981344077.464267.4670805396521914701.b4-ty@b4>
Date: Tue, 26 May 2026 10:37:20 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <02S8h3kHTCB.A.ptZK.yAdFqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3544
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/177981344077.464267.4670805396521914701.b4-ty@b4
Resent-Date: Tue, 26 May 2026 16:54:10 +0000 (UTC)
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel-dk.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mateusz.nowicki@posteo.net,m:csander@purestorage.com,m:iam@sung-woo.kim,m:josef@toxicpanda.com,m:agk@redhat.com,m:snitzer@kernel.org,m:mpatocka@redhat.com,m:bmarzins@redhat.com,m:ulfh@kernel.org,m:richard@nod.at,m:chengzhihao1@huawei.com,m:miquel.raynal@bootlin.com,m:vigneshr@ti.com,m:sven@kernel.org,m:j@jannau.net,m:neal@gompa.dev,m:kbusch@kernel.org,m:hch@lst.de,m:sagi@grimberg.me,m:justin.tee@broadcom.com,m:nareshgottumukkala83@gmail.com,m:paul.ely@broadcom.com,m:kch@nvidia.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:fourier.thomas@gmail.com,m:viro@zeniv.linux.org.uk,m:ziniu.wang_1@nxp.com,m:kees@kernel.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nbd@other.debian.org,m:dm-devel@lists.linux.dev,m:linux-mmc@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:fourierthomas@gmail.com,
 s:lists@lfdr.de];
	FORGED_SENDER(0.00)[axboe@kernel.dk,bounce-nbd=lists@other.debian.org];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[39];
	DMARC_NA(0.00)[kernel.dk];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	FREEMAIL_CC(0.00)[purestorage.com,sung-woo.kim,toxicpanda.com,redhat.com,kernel.org,nod.at,huawei.com,bootlin.com,ti.com,jannau.net,gompa.dev,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,HansenPartnership.com,oracle.com,zeniv.linux.org.uk,nxp.com,vger.kernel.org,other.debian.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[kernel-dk.20251104.gappssmtp.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,bounce-nbd=lists@other.debian.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel-dk.20251104.gappssmtp.com:dkim,bendel.debian.org:rdns,bendel.debian.org:helo]
X-Rspamd-Queue-Id: 2F0C15DA291
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 23 May 2026 12:52:35 +0000, Mateusz Nowicki wrote:
> numa_node in blk_mq_hw_ctx and the matching argument of
> blk_mq_ops::init_request can be NUMA_NO_NODE (-1).  Declared as
> unsigned int, NUMA_NO_NODE becomes UINT_MAX and walks off
> nvme_dev::descriptor_pools[] on CONFIG_NUMA=n [1].
> 
> Switch the field and the callback prototype to int and update all
> in-tree init_request implementations.  No functional change:
> cpu_to_node(), kmalloc_node() and blk_alloc_flush_queue() already
> take int.
> 
> [...]

Applied, thanks!

[1/1] block: switch numa_node to int in blk_mq_hw_ctx and init_request
      commit: 65e1c8f96ad1a1f3b72e8a91d1341d570f91d985

Best regards,
-- 
Jens Axboe



