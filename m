Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839C90A5D1
	for <lists+nbd@lfdr.de>; Mon, 17 Jun 2024 08:30:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2C2C52120E; Mon, 17 Jun 2024 06:30:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 17 06:30:34 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 23AAE21188
	for <lists-other-nbd@bendel.debian.org>; Mon, 17 Jun 2024 06:14:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.511 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hgyJiK0rmpud for <lists-other-nbd@bendel.debian.org>;
	Mon, 17 Jun 2024 06:14:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4BF322117C
	for <nbd@other.debian.org>; Mon, 17 Jun 2024 06:14:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E064A61127;
	Mon, 17 Jun 2024 06:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD93C2BD10;
	Mon, 17 Jun 2024 06:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718604866;
	bh=0lJUnETFqPY6tW6TrXFvmKZbVynd6dSdhAW9BC6m+kE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KOFdmVOJ7h8N9C7m0i5IH5j0T08893gjt00viGEXx0ITrjnEVSc7/n9x0PQNWhoCT
	 R0G81HXchAoQj63QO9zRTuNrWvr+9t+JPXFgDrlIxVtX306FULncwLvEYKw7dkrJFz
	 S6g5cy4QX7ofX49F8f+GhBjuuHoOe+F7NO0rxdIU4Xo0KJqwPt8S0uxmuFJz89cUcE
	 b/qPpB1pTQXoj1rhBApU3rTIJGnWH/qdRZJ9WOKQ+vU7PAj3CbnFFbcYvIj/VggV6B
	 QjSaWBl2euqvrvUDeNk514rvS2oC47UJWpHbvgG7uFw1q8j7/c3YYf4Afd7F+Ekvnv
	 W3vwVHRQv5iRw==
Message-ID: <d7b45e0b-68a9-4612-861a-7f192fbe6f84@kernel.org>
Date: Mon, 17 Jun 2024 15:14:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/26] loop: also use the default block size from an
 underlying block device
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
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
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>, Bart Van Assche <bvanassche@acm.org>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-8-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240617060532.127975-8-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pemPVMXOYGO.A.8ZbD.Kg9bmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3042
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d7b45e0b-68a9-4612-861a-7f192fbe6f84@kernel.org
Resent-Date: Mon, 17 Jun 2024 06:30:34 +0000 (UTC)

On 6/17/24 15:04, Christoph Hellwig wrote:
> Fix the code in loop_reconfigure_limits to pick a default block size for
> O_DIRECT file descriptors to also work when the loop device sits on top
> of a block device and not just on a regular file on a block device based
> file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

