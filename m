Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEB59033D6
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2024 09:36:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6AB4720673; Tue, 11 Jun 2024 07:36:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 07:36:21 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 17DAF20662
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2024 07:21:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.411 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id B-H6XkPld8Z4 for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2024 07:21:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E79112065B
	for <nbd@other.debian.org>; Tue, 11 Jun 2024 07:21:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5EAFE60C76;
	Tue, 11 Jun 2024 07:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B857C2BD10;
	Tue, 11 Jun 2024 07:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718090461;
	bh=SxGiXC2eXjeuicvqjgmxBbbuRkQDAALVXqGltltCvpM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J9t/JghW0gR/ETwdzjpl7VD7KnwAlMW8rRhwZr9kxWhQ6tl8Phg9WjO76NiKxxgu8
	 fLxeqF9M5t6BVVC5kK/sKL3zR1K2qLPoyVha6i0EJluUzp1kNJ5g2TNKh8g+EJPN33
	 hrljcXVnUuN8Lr5KlIujiAJZzEJDuCsFcPLl3jPutPmhKf9R0GeNiPNem29bg2OBO7
	 a1cFWzw0qNt9DSnc6yLqLEresNea8LBs8q7/++QEaUosyu+AjkSi/+C9VElPN9n7PP
	 XlPsIxsXYvBqYod+WVUBRRvW1FiyVSTv+Mlz8E7DodnwczmTJdbU3tnt32fP5VZhAs
	 3tDYxoJTsEL7w==
Message-ID: <6bf90562-0ff9-46b6-8a58-7381332e3beb@kernel.org>
Date: Tue, 11 Jun 2024 16:20:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/26] sd: move zone limits setup out of
 sd_read_block_characteristics
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Christoph B??hmwalder <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Roger Pau Monn?? <roger.pau@citrix.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
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
 <20240611055239.GA3141@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611055239.GA3141@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9aOkbdMUc-.A.TGON.15_ZmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2931
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6bf90562-0ff9-46b6-8a58-7381332e3beb@kernel.org
Resent-Date: Tue, 11 Jun 2024 07:36:21 +0000 (UTC)

On 6/11/24 2:52 PM, Christoph Hellwig wrote:
> On Tue, Jun 11, 2024 at 02:51:24PM +0900, Damien Le Moal wrote:
>>> -	if (lim->zoned)
>>> +	if (sdkp->device->type == TYPE_ZBC)
>>
>> Nit: use sd_is_zoned() here ?
> 
> Yes.
> 
>>> -	if (!sd_is_zoned(sdkp))
>>> +	if (!sd_is_zoned(sdkp)) {
>>> +		lim->zoned = false;
>>
>> Maybe we should clear the other zone related limits here ? If the drive is
>> reformatted/converted from SMR to CMR (FORMAT WITH PRESET), the other zone
>> limits may be set already, no ?
> 
> blk_validate_zoned_limits already takes care of that.

I do not think it does:

static int blk_validate_zoned_limits(struct queue_limits *lim)
{
        if (!lim->zoned) {
                if (WARN_ON_ONCE(lim->max_open_zones) ||
                    WARN_ON_ONCE(lim->max_active_zones) ||
                    WARN_ON_ONCE(lim->zone_write_granularity) ||
                    WARN_ON_ONCE(lim->max_zone_append_sectors))
                        return -EINVAL;
                return 0;
        }
	...

So setting lim->zoned to false without clearing the other limits potentially
will trigger warnings...

-- 
Damien Le Moal
Western Digital Research

