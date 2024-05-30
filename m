Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F168D52E2
	for <lists+nbd@lfdr.de>; Thu, 30 May 2024 22:09:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DB5B22051E; Thu, 30 May 2024 20:09:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 30 20:09:09 2024
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_LOW,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D12CC20510
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 May 2024 19:51:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VAtVR4Nj2--P for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 May 2024 19:51:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -6.6
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2ED092050C
	for <nbd@other.debian.org>; Thu, 30 May 2024 19:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4VqxhD06zdz6Cnk9V;
	Thu, 30 May 2024 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717098663; x=1719690664; bh=BLwZbOo2VuEjeawIOT3dZywp
	LeD1IzBghu5o+yp6hiA=; b=BMa7rd7XppGue5oaVmK2KHUY3MIK85AfzEEn+EKp
	bcNLOjbFEai52dS82B0yhSPKs5RyqQXlGiN4QD+YUDbrcAZHAjNBuw86VOjnbcWc
	KpSflEQS63VRNlvjxLG6uywRVDTYgOMSrCxedOS87bGL09MYLZfeGA3T5ub8rgQI
	sS/meOXbeO/ZoOUiTMgwb/aGcVJUK8awiaLnzIKJ7y1nfc5R9zHMSdwMeuPfjcqP
	3xL2my5/vEmEuShKNLcDV1pHPpTg6z1N0uk5Ah0GFOd0IfgaFouOWdGCAH9KTqO3
	3vxrR40G8smQRaSEyQHqccCit4O/AMIRLYUJfU2LODky0g==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id x4rVbmHKH9zP; Thu, 30 May 2024 19:51:03 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Vqxh56rNhz6Cnk9T;
	Thu, 30 May 2024 19:51:01 +0000 (UTC)
Message-ID: <391fad91-7a65-4b2d-aa5d-58a5bc341d5f@acm.org>
Date: Thu, 30 May 2024 12:51:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] sd: add a sd_disable_write_same helper
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
 <20240529050507.1392041-6-hch@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yHEgLY-OUaI.A.JkfO.lzNWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2846
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/391fad91-7a65-4b2d-aa5d-58a5bc341d5f@acm.org
Resent-Date: Thu, 30 May 2024 20:09:09 +0000 (UTC)

On 5/28/24 22:04, Christoph Hellwig wrote:
> Add helper to disable WRITE SAME when it is not supported and use it
> instead of sd_config_write_same in the I/O completion handler.  This
> avoids touching more fields than required in the I/O completion handler
> and  prepares for converting sd to use the atomic queue limits API.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

