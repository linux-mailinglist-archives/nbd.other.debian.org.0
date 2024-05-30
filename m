Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF98D5341
	for <lists+nbd@lfdr.de>; Thu, 30 May 2024 22:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 610162052B; Thu, 30 May 2024 20:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 30 20:18:09 2024
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CADB1204FE
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 May 2024 20:02:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ilfVHhdxPBTo for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 May 2024 20:02:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -6.6
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 82BCC204F2
	for <nbd@other.debian.org>; Thu, 30 May 2024 20:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4Vqxwz1Qt3z6Cnk9T;
	Thu, 30 May 2024 20:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717099326; x=1719691327; bh=mbOtu3q9zjV5nBmJEGmUM2Ch
	lXZYTtjXht6IjdlxuYo=; b=F/EUZ7ZoluH2NApSjB6LS4U+IseVIwCjj1+dB0GQ
	Hzd/jksY/Fw5Zro8gliSKkstCF1FjokCnbsfexxZKJdkTxEAEPIYDNL8Qr6xEnV9
	rJ7hsYcQWK7x55L8pxb/1Sxg7HUnHdJTyGXoCBAKmGZJnKsfm9hEfmMr40tWPhVi
	H6OveqevfRhZsr+gmDFCxlYpIB9o9xQP2SQ9BKfuKoYQ2KM6iZ+h17N6LqEDIWcJ
	VpoHnGJGnHY0dmLgFjDoWjP/wCgsZwF0k5CVqOvxoLdxfHwd8lS4d6WQoZn/kYPz
	/dr2Nfj8gmo+hFuTTKGCcdGS7oOPWkNQF2/83ZmILBkUCA==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id TbhOJyciqa7X; Thu, 30 May 2024 20:02:06 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Vqxwr3ZGLz6Cnk9F;
	Thu, 30 May 2024 20:02:04 +0000 (UTC)
Message-ID: <6d52dd83-0cad-448e-8a22-b6f0e1bcac46@acm.org>
Date: Thu, 30 May 2024 13:02:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] sd: simplify the disable case in sd_config_discard
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Josef Bacik
 <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
References: <20240529050507.1392041-1-hch@lst.de>
 <20240529050507.1392041-7-hch@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-7-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LrqZ47CIzzO.A.3kgO.B8NWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2847
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6d52dd83-0cad-448e-8a22-b6f0e1bcac46@acm.org
Resent-Date: Thu, 30 May 2024 20:18:09 +0000 (UTC)

On 5/28/24 22:04, Christoph Hellwig wrote:
> Fall through to the main call to blk_queue_max_discard_sectors given that
> max_blocks has been initialized to zero above instead of duplicating the
> call.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

