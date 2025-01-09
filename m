Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CB7A069DE
	for <lists+nbd@lfdr.de>; Thu,  9 Jan 2025 01:24:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 708C6205A8; Thu,  9 Jan 2025 00:24:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan  9 00:24:10 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FVGT_m_MULTI_ODD,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6BE95206C0
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Jan 2025 00:06:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.82 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FVGT_m_MULTI_ODD=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KNcpxWyZswi0 for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Jan 2025 00:05:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 396DF206BD
	for <nbd@other.debian.org>; Thu,  9 Jan 2025 00:05:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 01400A41DBE;
	Thu,  9 Jan 2025 00:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AC5C4CED3;
	Thu,  9 Jan 2025 00:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736381152;
	bh=DTOjgBiKSpoN3XkIpBaf09tRtrGiWwe2VWsbhvSVqH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FcZSPW5M1yUGhnYttcPLKbWZto0i0n+wCvbVzl7Gormh5kCsGamWMy0qFJl8hkIMK
	 3xhiTf/fa1EWteBie5+fHvhhME5upKUs7ze5T1cESu1muNMaSG01Q5BOnr98ncaFpp
	 fxm/zSKzpItsxBIrV7L7WE/OxW9dU9PeG0qNx+9RirZLUM0lgbULfq5f9jOeEs4qVj
	 DnGm9J77/uwXHdOl/1+fyDfIXzlZPJy8amwvC/Sfs7DUqbb4efwHaFB7Up6b8AifAM
	 aqwxCtOvMMcdcpRDQD+ZgN4+Tvm2jCGZW3L1zrUk7BSOWBU7PPlR3sP94+3K1BUBId
	 IkT5gLlwEZMaA==
Message-ID: <a3bd231c-0568-4dad-9268-bc7edaace94b@kernel.org>
Date: Thu, 9 Jan 2025 09:05:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] block: don't update BLK_FEAT_POLL in
 __blk_mq_update_nr_hw_queues
To: Christoph Hellwig <hch@lst.de>, Ming Lei <ming.lei@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net
References: <20250108092520.1325324-1-hch@lst.de>
 <20250108092520.1325324-4-hch@lst.de> <Z35T8xeLxhXe-zAS@fedora>
 <20250108152705.GA24792@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250108152705.GA24792@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GrGJn57m75K.A.u-EH.qcxfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3302
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a3bd231c-0568-4dad-9268-bc7edaace94b@kernel.org
Resent-Date: Thu,  9 Jan 2025 00:24:10 +0000 (UTC)

On 1/9/25 00:27, Christoph Hellwig wrote:
> On Wed, Jan 08, 2025 at 06:31:15PM +0800, Ming Lei wrote:
>>> -	if (!(q->limits.features & BLK_FEAT_POLL) &&
>>> -			(bio->bi_opf & REQ_POLLED)) {
>>> +	if ((bio->bi_opf & REQ_POLLED) && !bdev_can_poll(bdev)) {
>>
>> submit_bio_noacct() is called without grabbing .q_usage_counter,
>> so tagset may be freed now, then use-after-free on q->tag_set?
> 
> Indeed.  That also means the previous check wasn't reliable either.
> I think we can simple move the check into
> blk_mq_submit_bio/__submit_bio which means we'll do a bunch more
> checks before we eventually fail, but otherwise it'll work the
> same.

Given that the request queue is the same for all tag sets, I do not think we
need to have the queue_limits_start_update()/commit_update() within the tag set
loop in __blk_mq_update_nr_hw_queues(). So something like this should be enough
for an initial fix, no ?

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 8ac19d4ae3c0..ac71e9cee25b 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -4986,6 +4986,7 @@ static void __blk_mq_update_nr_hw_queues(struct
blk_mq_tag_set *set,
                                                        int nr_hw_queues)
 {
        struct request_queue *q;
+       struct queue_limits lim;
        LIST_HEAD(head);
        int prev_nr_hw_queues = set->nr_hw_queues;
        int i;
@@ -4999,8 +5000,10 @@ static void __blk_mq_update_nr_hw_queues(struct
blk_mq_tag_set *set,
        if (set->nr_maps == 1 && nr_hw_queues == set->nr_hw_queues)
                return;

+       lim = queue_limits_start_update(q);
        list_for_each_entry(q, &set->tag_list, tag_set_list)
                blk_mq_freeze_queue(q);
+
        /*
         * Switch IO scheduler to 'none', cleaning up the data associated
         * with the previous scheduler. We will switch back once we are done
@@ -5036,13 +5039,10 @@ static void __blk_mq_update_nr_hw_queues(struct
blk_mq_tag_set *set,
                        set->nr_hw_queues = prev_nr_hw_queues;
                        goto fallback;
                }
-               lim = queue_limits_start_update(q);
                if (blk_mq_can_poll(set))
                        lim.features |= BLK_FEAT_POLL;
                else
                        lim.features &= ~BLK_FEAT_POLL;
-               if (queue_limits_commit_update(q, &lim) < 0)
-                       pr_warn("updating the poll flag failed\n");
                blk_mq_map_swqueue(q);
        }

@@ -5059,6 +5059,9 @@ static void __blk_mq_update_nr_hw_queues(struct
blk_mq_tag_set *set,
        list_for_each_entry(q, &set->tag_list, tag_set_list)
                blk_mq_unfreeze_queue(q);

+       if (queue_limits_commit_update(q, &lim) < 0)
+               pr_warn("updating the poll flag failed\n");
+
        /* Free the excess tags when nr_hw_queues shrink. */
        for (i = set->nr_hw_queues; i < prev_nr_hw_queues; i++)
                __blk_mq_free_map_and_rqs(set, i);

With that, no modification of the hot path to check the poll feature should be
needed. And I also fail to see why we need to do the queue freeze for all tag
sets. Once should be enough as well...

-- 
Damien Le Moal
Western Digital Research

