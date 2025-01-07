Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9A9A03C71
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 11:33:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 21E312074F; Tue,  7 Jan 2025 10:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 10:33:09 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7945C2072A
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 10:12:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.538 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mPxDl5qMzhVe for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 10:12:52 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 147532070B
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 10:12:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2332C5C5DFE;
	Tue,  7 Jan 2025 10:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98D5C4CED6;
	Tue,  7 Jan 2025 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736244241;
	bh=rUve2nznfdJENEEcSgWwkof690ekE/iRC9z9WsHpcLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PA7cDLkyurapGnj8vGoiTcWIYoZrgj2LJcNu3/RwVpCDzqg47G9i3B5XHmroIH86A
	 9FQq7oHCRHUqnNLtuhNAXn6fH54CClksh0MJz9rZNPWQepCY4i8qg9D24npcAJJwq1
	 zo0kY3f9dsGMISWf0lpMBNc6zXYCVtciwqcqPjFTGCw0D20Dg7BFOfYUwe2mOnJyVb
	 4oLrjqghFC2PVOUQLfaWwOhDBzzOJ5235u3m1hhtZBIIGcfwh8D1znoZjchZKm0JDT
	 0NY1IYQ02tN/YWPwKR9C/EzVQQMKu9HjzYWXrk5kOHWsVmZH6t+G3z3u+eEs2gW2NV
	 T8B31lFjitg6w==
Message-ID: <a3c969a5-276b-4e14-8115-765991c560ba@kernel.org>
Date: Tue, 7 Jan 2025 19:03:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] block: fix docs for freezing of queue limits updates
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net
References: <20250107063120.1011593-1-hch@lst.de>
 <20250107063120.1011593-2-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250107063120.1011593-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <BtaWEDUvCAP.A.YnCK.lLQfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3263
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a3c969a5-276b-4e14-8115-765991c560ba@kernel.org
Resent-Date: Tue,  7 Jan 2025 10:33:09 +0000 (UTC)

On 1/7/25 15:30, Christoph Hellwig wrote:
> queue_limits_commit_update is the function that needs to operate on a
> frozen queue, not queue_limits_start_update.  Update the kerneldoc
> comments to reflect that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

With this comment fixed as Nilay suggested, feel free to add:

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

