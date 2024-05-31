Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A448D5A5C
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 08:12:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C7EB720559; Fri, 31 May 2024 06:12:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 06:12:20 2024
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9AE0F2050F
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 05:56:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fDEvKBhf9RQd for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 05:56:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F105E20533
	for <nbd@other.debian.org>; Fri, 31 May 2024 05:56:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0721C68BEB; Fri, 31 May 2024 07:48:33 +0200 (CEST)
Date: Fri, 31 May 2024 07:48:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: John Garry <john.g.garry@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	Roger Pau Monn?? <roger.pau@citrix.com>,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 09/12] sd: convert to the atomic queue limits API
Message-ID: <20240531054832.GB17396@lst.de>
References: <20240529050507.1392041-1-hch@lst.de> <20240529050507.1392041-10-hch@lst.de> <1a1854bb-1f28-44d1-a4ac-30872bd6c3c8@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a1854bb-1f28-44d1-a4ac-30872bd6c3c8@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <QjRQy11SQ7C.A.gPlF.EpWWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2854
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240531054832.GB17396@lst.de
Resent-Date: Fri, 31 May 2024 06:12:20 +0000 (UTC)

On Thu, May 30, 2024 at 10:16:33AM +0100, John Garry wrote:
>> -static void sd_config_write_same(struct scsi_disk *);
>> +static void sd_config_discard(struct scsi_disk *sdkp, struct queue_limits *lim,
>> +		unsigned int mode);
>
> Are there any reasons why we keep forward declarations like this? AFAICS, 
> this sd_config_discard forward declaration could be removed.

Mostly to avoid churn.  This is a series that needs to feed into the
block tree, so I don't want major churn in sd.c.  Maybe after the dust
has settled it would be nice to bring sd.c into a natural order.

>> -	blk_queue_max_write_zeroes_sectors(q, sdkp->max_ws_blocks *
>> -					 (logical_block_size >> 9));
>> +	lim->max_write_zeroes_sectors =
>> +		sdkp->max_ws_blocks * (logical_block_size >> 9);
>
> Would it be ok to use SECTOR_SHIFT here? A similar change is made in 
> sd_config_discard(), above

Sure.

>> +		sd_config_discard(sdkp, lim, sd_discard_mode(sdkp));
>>   	}
>>      out:
>> @@ -3278,10 +3290,10 @@ static void sd_read_block_limits_ext(struct scsi_disk *sdkp)
>>   }
>>     /**
>
> below is not a kernel doc comment

And that is on the one hand intentional to avoid documenting all the
obvious paramters in a local function, but on the other hand requires
removing the double *. Fixed.

>>   @@ -3683,28 +3696,33 @@ static int sd_revalidate_disk(struct gendisk 
>> *disk)
>>   	q->limits.max_dev_sectors = logical_to_sectors(sdp, dev_max);
>
>
> is setting q->limits.max_dev_sectors directly proper?

No, and I've already fixed it in my local tree.

