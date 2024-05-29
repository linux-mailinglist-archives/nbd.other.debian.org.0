Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 935538D3131
	for <lists+nbd@lfdr.de>; Wed, 29 May 2024 10:27:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 467E5204C0; Wed, 29 May 2024 08:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 08:27:09 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 79CAB204B8
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2024 08:10:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_HI=-5] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 33pJMzv7j1zI for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2024 08:10:53 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 311 seconds by postgrey-1.36 at bendel; Wed, 29 May 2024 08:10:53 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B9A96204B6
	for <nbd@other.debian.org>; Wed, 29 May 2024 08:10:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CFE16280B;
	Wed, 29 May 2024 08:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485B6C2BD10;
	Wed, 29 May 2024 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716970250;
	bh=PgFyg9WLnPMWyhLQvcC3XtuqulgVK5WUqskSxNXqJas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DZK1VEReps9AHETpZWUhqpsG+MI00Z0ABB6+gsyW4Gi/Z5H2wxRpGys0fUV/CkDBi
	 ekm5UCfe5kEy0dcpfusrq9SB9N1ZwavpRU82ufk8JfWE2lzM+/YXbDY2BXVIIMJY0E
	 T5zQzfJHsOYj5o65HP0rDO9kO+0LU/4axtrqsBUXTVh+zCLdt4IzBnkae9F0/64AST
	 gqMNnuwWzByDW5WKf7i4hE7fr6Q5anX+m2We3adJ81nyxudkw5rtlBVLP6JZkCEX3i
	 Pcy2SlsuFxqd5emx5tb3bXdTCobvVRykH3xWoY1UPtWqs2G9X7g/qXHlmyyZj0p92U
	 NdB9TJbaHuhIA==
Message-ID: <868a031d-a6f5-4f89-b0ee-f74f6ab38dbc@kernel.org>
Date: Wed, 29 May 2024 17:10:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] sd: add a sd_disable_discard helper
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Josef Bacik
 <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
References: <20240529050507.1392041-1-hch@lst.de>
 <20240529050507.1392041-5-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6plWzQPjb2P.A.6tNC.dbuVmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2829
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/868a031d-a6f5-4f89-b0ee-f74f6ab38dbc@kernel.org
Resent-Date: Wed, 29 May 2024 08:27:09 +0000 (UTC)

On 5/29/24 14:04, Christoph Hellwig wrote:
> Add helper to disable discard when it is not supported and use it
> instead of sd_config_discard in the I/O completion handler.  This avoids
> touching more fields than required in the I/O completion handler and
> prepares for converting sd to use the atomic queue limits API.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

