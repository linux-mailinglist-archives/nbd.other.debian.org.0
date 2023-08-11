Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E9778C8B
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 13:00:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BFF982063F; Fri, 11 Aug 2023 11:00:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 11:00:28 2023
Old-Return-Path: <brauner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2728520615
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:44:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.381 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Flvuc5lLUFMQ for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:44:47 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_IP=-2 (check from: .kernel. - helo: .dfw.source.kernel. - helo-domain: .kernel.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 11139205A5
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:44:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4AD2D61E58;
	Fri, 11 Aug 2023 10:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34573C433C7;
	Fri, 11 Aug 2023 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691750679;
	bh=kkdQzEAQ0sF7AzB1JBDDbcTt7pWf3ymQ9Td1BynCWLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RoukUon9sfsiciMjSOY6TVc8EqeSY93QZK24KKaNj5aMyzR1vasllKfU2NqxsS/Zh
	 EtlioH+wUgbrpcyyQ0zx+wE9vlXqiBdKjTAr8YnpePsR44z+Qm9LZK/Bz9G8K3nTJa
	 5Ods4z2uo8rS9DrNWHOQd+SdXc7YW5KImIAA6o4zV54G6XJUskvE6Ey9YPVOjCtHBY
	 Zte5IHKP0ey9bj+a4MDF8Tu7nUd5Vu3GOblEdr/EPvwu7Z35f8uyfvbpFAnN4lWt/W
	 kt9R3ElV7dxMZKEJjzdeyjx33visFZlFuUQFdyVLiisybuY3eXpzPSHHwP/UMB60FJ
	 sLHOFxaZCM2Vg==
Date: Fri, 11 Aug 2023 12:44:33 +0200
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
Subject: Re: [PATCH 01/17] FOLD: reverts part of "fs: use the super_block as
 holder when mounting file systems"
Message-ID: <20230811-codiert-ballen-159707b5d20e@brauner>
References: <20230811100828.1897174-1-hch@lst.de>
 <20230811100828.1897174-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230811100828.1897174-2-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aNCJdZfDuNB.A.m7G.MTh1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2615
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811-codiert-ballen-159707b5d20e@brauner
Resent-Date: Fri, 11 Aug 2023 11:00:28 +0000 (UTC)

On Fri, Aug 11, 2023 at 12:08:12PM +0200, Christoph Hellwig wrote:
> The btrfs hunk should be dropped because the prerequisite btrfs changes were
> dropped from the branch.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

I've already got that dropped in vfs.super.
So no need to for this.

