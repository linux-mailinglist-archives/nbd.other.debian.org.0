Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3388A90A0C6
	for <lists+nbd@lfdr.de>; Mon, 17 Jun 2024 01:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E5FA620CC9; Sun, 16 Jun 2024 23:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jun 16 23:18:10 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 752C02115D
	for <lists-other-nbd@bendel.debian.org>; Sun, 16 Jun 2024 23:01:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.511 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tfZ_eZTnwJU0 for <lists-other-nbd@bendel.debian.org>;
	Sun, 16 Jun 2024 23:01:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3EE6C2115A
	for <nbd@other.debian.org>; Sun, 16 Jun 2024 23:01:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 522C7CE0E5D;
	Sun, 16 Jun 2024 23:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAA0C2BD10;
	Sun, 16 Jun 2024 23:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718578869;
	bh=K48GiByJehCmQjwi20pmfnU+WsCyr4S6WxHNS+fcYIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gczAGXT2JgNBboue0aH6XDCajaGt0Tn9T6RNwUC8NdBoTEgjtTbwpmUfCPkjFQ9wM
	 MM968k+DIaMHgn73yxqDo9X2C3EJ5/755Y+99nXMZx497l32DWuxyKEgkUS1Mfauzi
	 zlSFlVj6tWpctoPTJ+wOY0xCMexSj4HtxdjXI3+rZfPjj6bie6Cukz6u7sVo5A7bEU
	 9rKTuHOjY9Tr5Ii5b3jprMmIgspdDlLslR4qSbgMPqGu86/2ypBmGpS+m4Lh9tPaWA
	 jbUd1obFjKTKufNm0BQAftChaDznmaK4Iq8S3q+7ZRNQrBkFu3/tvjG2xwv4gQQlB4
	 JHm9Ls++1gm6g==
Message-ID: <5a697233-0611-459d-b889-2e0133bbb541@kernel.org>
Date: Mon, 17 Jun 2024 08:01:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/26] sd: move zone limits setup out of
 sd_read_block_characteristics
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-3-hch@lst.de>
 <40ca8052-6ac1-4c1b-8c39-b0a7948839f8@kernel.org>
 <20240613093918.GA27629@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240613093918.GA27629@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Iyjco63MQEM.A.VotM.yK3bmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3010
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5a697233-0611-459d-b889-2e0133bbb541@kernel.org
Resent-Date: Sun, 16 Jun 2024 23:18:10 +0000 (UTC)

On 6/13/24 18:39, Christoph Hellwig wrote:
> On Tue, Jun 11, 2024 at 02:51:24PM +0900, Damien Le Moal wrote:
>>> +	if (sdkp->device->type == TYPE_ZBC)
>>
>> Nit: use sd_is_zoned() here ?
> 
> Actually - is there much in even keeping sd_is_zoned now that the
> host aware support is removed?  Just open coding the type check isn't
> any more code, and probably easier to follow.

Removing this helper is fine by me. There are only 2 call sites in sd.c and the
some of 4 calls in sd_zbc.c are not really needed:
1) The call in sd_zbc_print_zones() is not needed at all since this function is
called only for a zoned drive from sd_zbc_revalidate_zones().
2) The calls in sd_zbc_report_zones() and sd_zbc_cmnd_checks() are probably
useless as these are called only for zoned drives in the first place. The checks
would be useful only for passthrough commands, but then we do not really care
about these and the user will get a failure anyway if it tries to do ZBC
commands on non-ZBC drives.
3) That leaves only the call in sd_zbc_read_zones() but that check can probably
be moved to sd.c to conditionally call  sd_zbc_read_zones().

-- 
Damien Le Moal
Western Digital Research

