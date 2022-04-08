Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C31E4F9563
	for <lists+nbd@lfdr.de>; Fri,  8 Apr 2022 14:09:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2F1D520471; Fri,  8 Apr 2022 12:09:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr  8 12:09:52 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E31DB20441
	for <lists-other-nbd@bendel.debian.org>; Fri,  8 Apr 2022 12:09:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.889 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ExzxlbT51c1w for <lists-other-nbd@bendel.debian.org>;
	Fri,  8 Apr 2022 12:09:38 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id BA64D20296
	for <nbd@other.debian.org>; Fri,  8 Apr 2022 12:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649419773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3/5LgiypZmitecGlYXw4nBahHB8jlgATGrN1v3TxnVw=;
	b=YwDUMHpasMWR+r2idRMNQLLq2GZuVWWsBljSkxyzI/NgHAudcjgnX0HXBpQEeLKIqgtXME
	rJNEV5CiUptW72Wo8fmr23WoXwLJC/suCoQz53dPbggvu+YTtZ4YYq1vagAD9Wk1Ff4uuT
	WQBwIclN442DQ9D4An8zIXeMxVGeRB4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-02SleKqNN6WFZewqT2jSPw-1; Fri, 08 Apr 2022 08:09:30 -0400
X-MC-Unique: 02SleKqNN6WFZewqT2jSPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80DEF83396A;
	Fri,  8 Apr 2022 12:09:30 +0000 (UTC)
Received: from localhost (unknown [10.39.192.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB94D404729C;
	Fri,  8 Apr 2022 12:09:29 +0000 (UTC)
Date: Fri, 8 Apr 2022 13:09:29 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: v.sementsov-og@mail.ru, Eric Blake <eblake@redhat.com>,
	libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [PATCH 1/2] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
Message-ID: <20220408120929.GM8021@redhat.com>
References: <20220407213720.250252-1-eblake@redhat.com>
 <20220407213720.250252-2-eblake@redhat.com>
 <Yk/jTZcHpW5qWsvg@pc181009.grep.be>
 <20220408115244.GL8021@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220408115244.GL8021@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oJBDnUiREVC.A.lVD.QYCUiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1927
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220408120929.GM8021@redhat.com
Resent-Date: Fri,  8 Apr 2022 12:09:52 +0000 (UTC)

On Fri, Apr 08, 2022 at 12:52:44PM +0100, Richard W.M. Jones wrote:
> From experimentation I found this really hurts my laptop :-(

... because of a memory leak in the nbdkit Python bindings as it
turned out.  This function:

> def extents(h, count, offset, flags):
>     e = [(i, 1, typ(i)) for i in range(offset, offset + count + 1)]
>     return e

returns tuples which never got dereferenced in the C part.

Fixed in:

https://gitlab.com/nbdkit/nbdkit/-/commit/4ede3d7b0778cc1fe661307d2289fadfc18a1af2

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

