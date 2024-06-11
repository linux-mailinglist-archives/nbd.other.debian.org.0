Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 508B89036C6
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2024 10:40:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 35F4D206B8; Tue, 11 Jun 2024 08:40:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 08:40:31 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E917B20694
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2024 08:24:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.511 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2ksKGl7uY4xM for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2024 08:24:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 47D8A2055D
	for <nbd@other.debian.org>; Tue, 11 Jun 2024 08:24:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8C529CE1986;
	Tue, 11 Jun 2024 08:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FE3C2BD10;
	Tue, 11 Jun 2024 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718094282;
	bh=aa39oj6grsQuWCvXe8Xg/GJ/V11Jvezu/rMLECj5P4s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aV9kUDMWPWfXNXmeOO+XWzXEhkoXq7ADFSgqT6UOp6QmIpyBhYF9XRI2luZ1jDGrm
	 fjnG6eWakSd1CNbsGjF5O5LrabvpJGoxEOU9IkGiZiHR46HxhFdMHk0kIvmZI9wx0L
	 JOsygBPd1TdA6IDc/8xDg7nKHyfJ/2D590dnIGGMTWnavCtGtya+9Az2pKzwaIFhFJ
	 j4onYH3Luprc5hdFhkVV5RWd7C4hgmyLZChJZgAFOBU129M9EEZQ0rLACWD8TZ/l9S
	 OXq+G88IRiQo0zQ3DlC2WKDuqnhjQLUQDaVvY8Aat/yU/aTyp6lpmYzMIDEOv1I7i1
	 CT8Dtiuz6hADg==
Message-ID: <d457fc95-9231-4bc8-a2dd-2991aa8732ec@kernel.org>
Date: Tue, 11 Jun 2024 17:24:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/26] block: move the pci_p2pdma flag to queue_limits
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
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-25-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-25-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dtRTFKJEKzI.A.yuPO._1AamB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2961
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d457fc95-9231-4bc8-a2dd-2991aa8732ec@kernel.org
Resent-Date: Tue, 11 Jun 2024 08:40:31 +0000 (UTC)

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move the pci_p2pdma flag into the queue_limits feature field so that it
> can be set atomically and all I/O is frozen when changing the flag.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

