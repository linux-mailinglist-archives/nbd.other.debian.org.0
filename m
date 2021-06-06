Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 327B039D007
	for <lists+nbd@lfdr.de>; Sun,  6 Jun 2021 18:38:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 18CB7204FB; Sun,  6 Jun 2021 16:38:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jun  6 16:38:14 2021
Old-Return-Path: <geoff@infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,NICE_REPLY_A autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 36CCD204F3
	for <lists-other-nbd@bendel.debian.org>; Sun,  6 Jun 2021 16:38:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CB_dyx40sevq for <lists-other-nbd@bendel.debian.org>;
	Sun,  6 Jun 2021 16:38:01 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 2328 seconds by postgrey-1.36 at bendel; Sun, 06 Jun 2021 16:38:01 UTC
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5314F20365
	for <nbd@other.debian.org>; Sun,  6 Jun 2021 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xdRwc0+fblxjQWSVfAPrq01sy/g65/LWQdwS7diPzUY=; b=RvNcIfOg5he7n2s7JHDwQwMsUb
	CcsUaraj9QikvzUVMg5uaZVxCkfUMNQpaQoSlSwpFt8En2sRCM3NnRZMB+TpNhFzfHmMKG/4QmVWD
	gCRylCpd2RxMohedFycN/JmPwi64URVSbmxExLKam6OQFwHVi2N5sD9jwXDe8EtAAA/oB8PR9GaaH
	81bj3Hi0GApRdsWIMvWsT4imii1ALjOAkwG/eKwvQ5JhVh4A9McAwOX5gB0KW+xEHm5Q+zGPNdNaj
	3+RxDUZtyJrK0//PQYuM0gsnGyORNLu/D139Iz76bmVhQgjZJrrEjMdarouhAZYzFh+UMlCC+cVvz
	GBTLTYTQ==;
Received: from [2602:306:c5a2:a380:d04c:9a1:1990:7d22]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpvAk-0044Sh-0J; Sun, 06 Jun 2021 15:58:53 +0000
Subject: Re: [PATCH 10/30] ps3disk: use blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>,
 Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>,
 Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal"
 <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-11-hch@lst.de>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <c9d63809-a7cc-8907-6065-f14add05a5dc@infradead.org>
Date: Sun, 6 Jun 2021 08:58:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602065345.355274-11-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Al1VX4u2BVN.A.9HE.2nPvgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1209
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c9d63809-a7cc-8907-6065-f14add05a5dc@infradead.org
Resent-Date: Sun,  6 Jun 2021 16:38:14 +0000 (UTC)

Hi Christoph,

On 6/1/21 11:53 PM, Christoph Hellwig wrote:
> Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
> allocation.
> 
>  drivers/block/ps3disk.c | 36 ++++++++++++++----------------------
>  1 file changed, 14 insertions(+), 22 deletions(-)

I tested your alloc_disk-part2 branch on PS3, and it seemed to be working OK.

Tested-by: Geoff Levand <geoff@infradead.org>

