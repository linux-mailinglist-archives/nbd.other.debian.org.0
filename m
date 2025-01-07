Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB90A03C30
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 11:21:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 901C52073F; Tue,  7 Jan 2025 10:21:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 10:21:16 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LONGWORD,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 53D7020728
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 10:05:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.84 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LONGWORD=2,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eDegwldCF8xU for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 10:05:16 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 303 seconds by postgrey-1.36 at bendel; Tue, 07 Jan 2025 10:05:16 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7751C20725
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 10:05:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44E285C5A89;
	Tue,  7 Jan 2025 10:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7711C4CED6;
	Tue,  7 Jan 2025 10:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736244313;
	bh=YfTW/VCU8RjS9S1lJNIo16WQ/Ki1VbCtrWDcuUTA3TE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RuawTMIQ0dmGB+M6Kz6Ulhzj9Kj3RzFx6gq40uH7T2AYtb4YbVFFYdzDpOI61xMWv
	 a0Rx9IW+SkYVgpNmmia+ITJEY8nBaVd4DNp+DrBnYBLOI6lcdFrwH7G4j0MHToNdfB
	 YH51M77EAucAnSuGgpjjiOnvUqD/TM35Y9dTXp0IY91Fgr7LvEpyaNnO0A7zcrHGlP
	 WGB2SahGhi8YwkJ3vow5kuYxzHJsiU9jgZbyVzunVvsAq21txpymMlaN9DFP5V10uW
	 SMtAML03BcSQbxHVZsSS9Ml//mYsdH1pbgulfBMPNeIjKIZSac25BAaW4DeUJygpiO
	 jmv2gpOc0oX0g==
Message-ID: <68c4acb7-8d2f-4163-a0e2-c9c5395dcedb@kernel.org>
Date: Tue, 7 Jan 2025 19:05:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] block: add a queue_limits_commit_update_frozen helper
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net
References: <20250107063120.1011593-1-hch@lst.de>
 <20250107063120.1011593-3-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250107063120.1011593-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pZdqc5hXVuJ.A.GZ-J.cAQfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3259
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/68c4acb7-8d2f-4163-a0e2-c9c5395dcedb@kernel.org
Resent-Date: Tue,  7 Jan 2025 10:21:16 +0000 (UTC)

On 1/7/25 15:30, Christoph Hellwig wrote:
> Add a helper that freezes the queue, updates the queue limits and
> unfreezes the queue and convert all open coded versions of that to the
> new helper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>


-- 
Damien Le Moal
Western Digital Research

