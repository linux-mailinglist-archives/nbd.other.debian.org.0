Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C9D40DAB9
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 15:09:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ADD402090C; Thu, 16 Sep 2021 13:09:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 13:09:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3402C2084A
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 12:53:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.279 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pXwlBKjoJ-Y8 for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 12:53:03 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 941F1207B5
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 12:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631796778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H8J3fppm6pGsClKVQLZLoovJbj+NoBnYknLOjFM8iOM=;
	b=HzjPtlu/X8RFs6ECE0oU9rwu1GvJslGYgYCYsGaLJ8nIfIW+KteNcbfNelSrncrAzBJ5tX
	dPAHCd2Ztmd8WqUxVvFT+5mzE1NGfOuTULrSPd0Q1EMlsrQFa5QFR5JJWFNkIsO/dF3cgL
	GaMJ0J2nM5JYr3jpe7BLVcC+dyUcQuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-vxaAx6DkOvyY7YFkM6E1zQ-1; Thu, 16 Sep 2021 08:52:57 -0400
X-MC-Unique: vxaAx6DkOvyY7YFkM6E1zQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0913D10B744E;
	Thu, 16 Sep 2021 12:52:56 +0000 (UTC)
Received: from T590 (ovpn-12-89.pek2.redhat.com [10.72.12.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DC9D5D9C6;
	Thu, 16 Sep 2021 12:52:51 +0000 (UTC)
Date: Thu, 16 Sep 2021 20:53:04 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, hch@infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [patch v8 6/7] nbd: partition nbd_read_stat() into
 nbd_read_reply() and nbd_handle_reply()
Message-ID: <YUM+MOErUpN3bgOT@T590>
References: <20210916093350.1410403-1-yukuai3@huawei.com>
 <20210916093350.1410403-7-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916093350.1410403-7-yukuai3@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qLr77lvmVIE.A.5OC.1H0QhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1505
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUM+MOErUpN3bgOT@T590
Resent-Date: Thu, 16 Sep 2021 13:09:09 +0000 (UTC)

On Thu, Sep 16, 2021 at 05:33:49PM +0800, Yu Kuai wrote:
> Prepare to fix uaf in nbd_read_stat(), no functional changes.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming

