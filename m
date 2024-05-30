Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B208D52C5
	for <lists+nbd@lfdr.de>; Thu, 30 May 2024 22:03:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A229D20509; Thu, 30 May 2024 20:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 30 20:03:09 2024
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2CCE220509
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 May 2024 19:45:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 30kO4XGVJPVS for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 May 2024 19:44:57 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_MX=-3.1 (check from: .acm. - helo: .009.lax.mailroute. - helo-domain: .mailroute.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -6.6
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7B63F20507
	for <nbd@other.debian.org>; Thu, 30 May 2024 19:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4VqxY061N4zlgMVV;
	Thu, 30 May 2024 19:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717098288; x=1719690289; bh=1qawYRnNtHLyKkfk2KIuL7Vw
	Fij1fGlSBD1rE6Kec4k=; b=O+dyHa1DO+LxwuvN37caN3rc79Al5B59aVt872Yy
	myvPBRd3qJOpB/ssbZf9DD6jeQwG3oky5nPyGHmKtOjLfDnHlE+e3wVIfqzpWjOs
	6hfPZNndbOYIdhdiprqYgfQpwZxp2KIDZmAsJBYG5LuLkM6flrrsn+Z7CP3aCzDV
	pwN4+gbFQD4bp6z4s36qcFNV+1waUaRjvrfL+xtNhs1hivVR8LlUKLXvQ4CEJ/sF
	RymJznQ8+fPT5LcsiI4IQupBmhHjJpPce8ad1C01w5LQVIcRKBZRcPzwxcXH/hff
	wu+Gqo4QOptIYFBfw/rmjL36jeH02rPcp9YADbGYnOeaDg==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id XhrHqHFE5lIy; Thu, 30 May 2024 19:44:48 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4VqxXv0mMXzlgMVR;
	Thu, 30 May 2024 19:44:46 +0000 (UTC)
Message-ID: <2384c3c9-5629-4438-a87b-0e05e1b6f5cc@acm.org>
Date: Thu, 30 May 2024 12:44:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] ubd: untagle discard vs write zeroes not support
 handling
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
 <20240529050507.1392041-2-hch@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5_gyFtk5ZGP.A.zZeO.9tNWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2841
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2384c3c9-5629-4438-a87b-0e05e1b6f5cc@acm.org
Resent-Date: Thu, 30 May 2024 20:03:09 +0000 (UTC)

On 5/28/24 22:04, Christoph Hellwig wrote:
> Discard and Write Zeroes are different operation and implemented
> by different fallocate opcodes for ubd.  If one fails the other one
> can work and vice versa.
> 
> Split the code to disable the operations in ubd_handler to only
> disable the operation that actually failed.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

