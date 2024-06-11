Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848A903403
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2024 09:42:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B470A20675; Tue, 11 Jun 2024 07:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 07:42:09 2024
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
	by bendel.debian.org (Postfix) with ESMTP id 258B720669
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2024 07:25:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.411 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id maTmR1Kbu0z0 for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2024 07:25:31 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .sin.source.kernel. - helo-domain: .kernel.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 77F5C20668
	for <nbd@other.debian.org>; Tue, 11 Jun 2024 07:25:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B2D1CCE19E4;
	Tue, 11 Jun 2024 07:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F46C2BD10;
	Tue, 11 Jun 2024 07:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718090724;
	bh=SKDzpdZjTAHkWp+zsEQwH6Ky8PVIUSEQggaioawXXkU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UCtiHiiw5QvJYmElyhHUIvI9qZN2kq7wHApTDMzEobrX5tFMllUF7QgwTYv0VDSQe
	 4AvJZ9Xc1WQTZynkZ5eqZVN35p41xaFCgmlC7UMaLIvvCM36uO+T8E3D8B2kWkrwrw
	 CxnQ5rfAOwcQk9F3stXF5NyYVqFnlDWOGrsxEQrWt2LCiqL+fvPkUXoNp9aPDrZKK/
	 Jf1WpJR5Tfo8C4kN4+IDjAFgA3wv+/TYcPyqih/c85wJGX2v2SpjxCABdfzaKWUWw8
	 mwFNFCAMG5oIrZT1WMKm7NaX1XpI2tHzzzRuvurRNs7Kd2xxeNWyHz9cxkpcbZ5fhc
	 X7SraO1QML8XQ==
Message-ID: <92df5033-5df7-4b2a-98ad-a27f8443ee6a@kernel.org>
Date: Tue, 11 Jun 2024 16:25:18 +0900
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
 <20240611055239.GA3141@lst.de> <20240611055405.GA3256@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611055405.GA3256@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <f7_Z-yVkzwF.A.2aQN.R__ZmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2932
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/92df5033-5df7-4b2a-98ad-a27f8443ee6a@kernel.org
Resent-Date: Tue, 11 Jun 2024 07:42:09 +0000 (UTC)

On 6/11/24 2:54 PM, Christoph Hellwig wrote:
> On Tue, Jun 11, 2024 at 07:52:39AM +0200, Christoph Hellwig wrote:
>>> Maybe we should clear the other zone related limits here ? If the drive is
>>> reformatted/converted from SMR to CMR (FORMAT WITH PRESET), the other zone
>>> limits may be set already, no ?
>>
>> blk_validate_zoned_limits already takes care of that.
> 
> Sorry, brainfart.  The integrity code does that, but not the zoned
> code.  I suspect the core code might be a better place for it,
> though.

Yes. Just replied to your previous email before seeing this one.
I think that:

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

could be changed into:

static int blk_validate_zoned_limits(struct queue_limits *lim)
{
	if (!lim->zoned) {
                lim->max_open_zones = 0;
		lim->max_active_zones = 0;
		lim->zone_write_granularity = 0;
		lim->max_zone_append_sectors = 0
		return 0;
	}

But then we would not see "bad" drivers. Could have a small

blk_clear_zoned_limits(struct queue_limits *lim)

helper too.

-- 
Damien Le Moal
Western Digital Research

