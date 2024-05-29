Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 114CC8D31C3
	for <lists+nbd@lfdr.de>; Wed, 29 May 2024 10:42:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AC1ED2053A; Wed, 29 May 2024 08:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 08:42:09 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DB451204C0
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2024 08:25:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.5 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ji2poje02CsV for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2024 08:25:17 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 382F4204B8
	for <nbd@other.debian.org>; Wed, 29 May 2024 08:25:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ED81CCE1185;
	Wed, 29 May 2024 08:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34391C2BD10;
	Wed, 29 May 2024 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716971112;
	bh=68h8q5F+j4pjKEcxNZSHuDAUqZpgnW57uKiQqJYjvXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cqyEaNLJFYd4VgaxK4xOgO1fLB7/V2NkEYcZNMj3ccG2Mzvpp61LRxO5H4wNFOXas
	 9i9P5vApYqzNiVftsPqH6+3ivxqZDbQQpXB9SIohRK0TdnoPp833Z44jgkjFhNZuhY
	 BGPG5IuhLO8Vo39srFS1asTLrRf87QTWOJrOiQEM6H9VY7vVFKAL0M8AaZGrySb+3e
	 wtua7SU6aKnlakSQaBr/SFZqCqkbfJyWm4sHhHK/vx2ZqIcj/ebCP9P4hluFoJ78kb
	 xa2RVmjSw0F9dLWXjsdQcxM1ZvFiEoX8BWzuuviifbIpZoK74eW2DiuDsdsaVYZzqk
	 NPfPYWCoLxCZw==
Message-ID: <1048ffa4-36bb-4d72-9abf-a8e2dfc874c2@kernel.org>
Date: Wed, 29 May 2024 17:25:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] sr: convert to the atomic queue limits API
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
 <20240529050507.1392041-11-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-11-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5xQSh3osPaN.A.TMTC.hpuVmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2836
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1048ffa4-36bb-4d72-9abf-a8e2dfc874c2@kernel.org
Resent-Date: Wed, 29 May 2024 08:42:09 +0000 (UTC)

On 5/29/24 14:04, Christoph Hellwig wrote:
> Assign all queue limits through a local queue_limits variable and
> queue_limits_commit_update so that we can't race updating them from
> multiple places, and free the queue when updating them so that
> in-progress I/O submissions don't see half-updated limits.
> 
> Also use the chance to clean up variable names to standard ones.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

