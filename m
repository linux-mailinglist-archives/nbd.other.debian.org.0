Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 667DE779030
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 15:06:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 16D072064F; Fri, 11 Aug 2023 13:06:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 13:06:11 2023
Old-Return-Path: <brauner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0B2D7205FE
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 12:49:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.481 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id q5WkpNXhaGMW for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 12:49:07 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 60B6D205CD
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 12:49:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 167AE64749;
	Fri, 11 Aug 2023 12:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03536C433C8;
	Fri, 11 Aug 2023 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691758143;
	bh=ejIUNFO7vD5+JAhPZ7uJRR/J5AhcRrudBRP7+EnTl0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HXvwatSPGWudGtF+0zb3+i8/8EZHT7CDtvPfZ616wj4sSEBiDQgFyK/j+9BklCYkk
	 iOrOrH/Ny9lYKv95OxHW08M0OPf1yx+XLb9hxxzHb/Z6lXMRl2R4lnNX5ofV2zkz/O
	 54yTbvDXGqTl2PhJUYM8Ej9ZIYpkH1Zz8aOkUPWDus44pXDpu7RduXHF+ic//DHz6p
	 FjxNNGnvPVFnAkUyzcU6X7Mjqt8Zc+tHEz0sME0qV7LgBoEAUAZA40crjocb6FnwlM
	 cQr1Up+zWrGYLXCZ4uLZ1+4PaZaj3rjfx4BchygqFQqqyIeWJyfQ4jmCsuPTYWM7Ik
	 zsd4Mia8YDZAg==
Date: Fri, 11 Aug 2023 14:48:57 +0200
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
Subject: Re: [PATCH 17/17] fs: simplify invalidate_inodes
Message-ID: <20230811-warnt-vorhaben-54641d422810@brauner>
References: <20230811100828.1897174-1-hch@lst.de>
 <20230811100828.1897174-18-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230811100828.1897174-18-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gZpcD39C49C.A.mpH.DJj1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2622
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811-warnt-vorhaben-54641d422810@brauner
Resent-Date: Fri, 11 Aug 2023 13:06:12 +0000 (UTC)

On Fri, Aug 11, 2023 at 12:08:28PM +0200, Christoph Hellwig wrote:
> kill_dirty has always been true for a long time, so hard code it and
> remove the unused return value.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>

