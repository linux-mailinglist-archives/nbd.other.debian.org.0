Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F2305778EF6
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 14:18:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DF43720560; Fri, 11 Aug 2023 12:18:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 12:18:15 2023
Old-Return-Path: <brauner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F2C40205AE
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 12:00:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.481 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id apDbDHfu2s7Y for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 12:00:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 64B74205D2
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 12:00:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A9F966199;
	Fri, 11 Aug 2023 12:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484DEC433C8;
	Fri, 11 Aug 2023 12:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691755240;
	bh=h1A0pwSYdGRiztn+35Ytfz2xZHIvLutIoQC+rYe6Fps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pes/7yPQXcZvN/dCKMTT7ZhnFt60oysAwfX2rnFI4NoJLDnY11LtAqJpe5SHprOFs
	 rAxkvtmIit6vO3r1XFrM/YcvQvye2QTKkl2E74IQEZBC4Xx+LHCjRngmnw/Td7AhWh
	 S/ahThn24vkazsk2fwITtYHKT415rfuI6XnFl1wEyOIKDoszqDjv1j/zoUPiUq0jgy
	 UH0XBfehpFUpXEOG3H75Ms+rfiTsX8kpwbU2mouO62XGIuZzuVnkQQFV02gGV/YRlF
	 0VQUls9O6tkqucucmvr2htcKNnUef6roGv5FxasF0LcnwRAtDUOJzyR2uJSjBwlLFe
	 Hqp0sW3YKbD5Q==
Date: Fri, 11 Aug 2023 14:00:33 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	"Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-s390@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 02/17] btrfs: always open the device read-only in
 btrfs_scan_one_device
Message-ID: <20230811-ereignen-mitangeklagt-84cf0f213549@brauner>
References: <20230811100828.1897174-1-hch@lst.de>
 <20230811100828.1897174-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230811100828.1897174-3-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eEJmI7ClRFC.A.qsD.Hci1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2616
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811-ereignen-mitangeklagt-84cf0f213549@brauner
Resent-Date: Fri, 11 Aug 2023 12:18:15 +0000 (UTC)

On Fri, Aug 11, 2023 at 12:08:13PM +0200, Christoph Hellwig wrote:
> btrfs_scan_one_device opens the block device only to read the super
> block.  Instead of passing a blk_mode_t argument to sometimes open
> it for writing, just hard code BLK_OPEN_READ as it will never write
> to the device or hand the block_device out to someone else.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>

