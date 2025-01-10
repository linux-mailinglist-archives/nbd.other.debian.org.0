Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B7085A08D8A
	for <lists+nbd@lfdr.de>; Fri, 10 Jan 2025 11:12:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A54D4206AA; Fri, 10 Jan 2025 10:12:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 10 10:12:13 2025
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 29CFD205AF
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Jan 2025 09:56:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.002 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2h2C_L2Kv6h0 for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Jan 2025 09:56:07 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4BF75205AB
	for <nbd@other.debian.org>; Fri, 10 Jan 2025 09:56:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 32AEA68BFE; Fri, 10 Jan 2025 10:56:01 +0100 (CET)
Date: Fri, 10 Jan 2025 10:56:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: John Garry <john.g.garry@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
	Nilay Shroff <nilay@linux.ibm.com>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, nbd@other.debian.org,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: Re: [PATCH 05/11] block: add a store_limit operations for sysfs
 entries
Message-ID: <20250110095601.GA11121@lst.de>
References: <20250110054726.1499538-1-hch@lst.de> <20250110054726.1499538-6-hch@lst.de> <e7177a33-aebd-4828-87b0-f790b4fb1306@oracle.com> <20250110091859.GA8373@lst.de> <68cd5371-f4ca-44c0-8ac7-c734da04f877@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68cd5371-f4ca-44c0-8ac7-c734da04f877@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <q1OHBm-HuaO.A.rB7G.9JPgnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3344
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250110095601.GA11121@lst.de
Resent-Date: Fri, 10 Jan 2025 10:12:13 +0000 (UTC)

On Fri, Jan 10, 2025 at 09:51:18AM +0000, John Garry wrote:
> ok, and that just comes down to the behavior of queue_var_store(), which 
> mimics sysfs_ops.store
>
> I will note that queue_var_store and queue_var_store64 differ in behaviour 
> here :(
>
>> ->store_limits uses
>> the simpler and harder to get wrong convention of returning 0 on
>> success.
>>
>
> understood, so any reason why not to change the rest (apart from being 
> busy)?

Not real urge.  The idea here was to get it right for the new one.
Changing the existing would be a lot of churn for a relatively small
improvement.  For me that's only worth it when touching the area anyway.
Which might or might not happen when trying to remove the sysfs_lock
around ->store.

