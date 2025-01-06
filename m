Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D7A0268A
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 14:27:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8343A207A0; Mon,  6 Jan 2025 13:27:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 13:27:10 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LONGWORD,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1CAA82079D
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 13:09:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.84 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LONGWORD=2,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id veBTMaIkk_Mi for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 13:09:22 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3A71520700
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 13:09:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F6CCA4161B;
	Mon,  6 Jan 2025 13:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA76C4CED2;
	Mon,  6 Jan 2025 13:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736168958;
	bh=LOAg8h56rNknhvkQW9bBtvxkT/tYtQaf+5iBZRhzhwI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mVZK0Qt9V9R6rsS1of2npm5DS4L36FTlIJGY7+xPX5wx3mFAzj5FQohWkDVU2XRyz
	 7n/2cTBTFpq2PU3nXvxCTSfirLciNWP/1MPzMKiwUYTda+mxr4rrYUdJaMdnkY1iZI
	 uBRhncH2HZCpeSgqXKStlmme172qYcPgr0DOBWHy/wpIQl0g0OcU5FrSyzm5Ai3GFb
	 i/VS5E8FhgHmRp2AZXt1tppN233nc4qhlIDJG7e2CDyqmeS1WNTQCNGEG+as4xTC6x
	 mtF0jl48v/v3853HHkzxIE7MACWuOxF+uznsSW8M4uOUxYRQ9ITBNj5UPAMdVWNtUf
	 rb3ZdCU6hgzAg==
Message-ID: <3cf61c5f-b53b-43b6-90de-e42272f74e3f@kernel.org>
Date: Mon, 6 Jan 2025 22:09:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] virtio_blk: use queue_limits_commit_update_frozen
 in cache_type_store
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>,
 Nilay Shroff <nilay@linux.ibm.com>, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, nbd@other.debian.org,
 virtualization@lists.linux.dev, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net
References: <20250106100645.850445-1-hch@lst.de>
 <20250106100645.850445-7-hch@lst.de>
 <07353499-b62d-488a-9575-12de5d9b6f2e@kernel.org>
 <20250106105957.GC21833@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250106105957.GC21833@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XdAfp2_NkxD.A.-bpJ.uo9enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3231
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3cf61c5f-b53b-43b6-90de-e42272f74e3f@kernel.org
Resent-Date: Mon,  6 Jan 2025 13:27:10 +0000 (UTC)

On 1/6/25 19:59, Christoph Hellwig wrote:
> On Mon, Jan 06, 2025 at 07:56:19PM +0900, Damien Le Moal wrote:
>> On 1/6/25 7:06 PM, Christoph Hellwig wrote:
>>> So far cache_type_store didn't freeze the queue, fix that by using the
>>> queue_limits_commit_update_frozen helper.
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>
>> This should be squashed in patch 2, no ?
> 
> patch 2 is supposed to just be a mechanical conversion, and each
> behavior change should be in it's own patch.

Sounds good to me, but let's be consistent then: do not remove the
freeze/unfreeze from virtio_blk in patch 2 and do it here in this patch.
Otherwise, patch 2 *does* change the behavior of virtio_blk, introducing a bug
(missing freeze around commit update).


-- 
Damien Le Moal
Western Digital Research

