Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAB1890393
	for <lists+nbd@lfdr.de>; Thu, 28 Mar 2024 16:42:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 03DD120B07; Thu, 28 Mar 2024 15:42:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 28 15:42:26 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50,WORD_WITHOUT_VOWELS
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DE6DC20AFA
	for <lists-other-nbd@bendel.debian.org>; Thu, 28 Mar 2024 15:42:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.544 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.065, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YxRDHR1tS7yg for <lists-other-nbd@bendel.debian.org>;
	Thu, 28 Mar 2024 15:42:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 8DE0820AE7
	for <nbd@other.debian.org>; Thu, 28 Mar 2024 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711640521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H3yn9yhhlu2WBjLcHy+XH1SgMqK60qAwKpD2k/Zdlek=;
	b=FjXLQ5rcN4sFtt9RPq0b7zXaooZUUmFhoWJRB2hreQeLO/BkUo5BWXSW9/2dXcQCZcnSRd
	mGVPRef1VN0i0ma608Bb49zlNulqgJDSwLJ7/4cCuCSFDXXDd5WtWqpIWl+HkzMRL+kulR
	OEDjDso6dYpeQ+HWrKpFED3Z7hssYzc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-Wi_ZRyd7Mm2rAzFYt6QL7Q-1; Thu, 28 Mar 2024 11:06:08 -0400
X-MC-Unique: Wi_ZRyd7Mm2rAzFYt6QL7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79A34101A523;
	Thu, 28 Mar 2024 15:06:08 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.33])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32F2B17AA0;
	Thu, 28 Mar 2024 15:06:07 +0000 (UTC)
Date: Thu, 28 Mar 2024 10:06:01 -0500
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, qemu-devel@nongnu.org, 
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [PATCH for-9.1 6/9] block/nbd: Use URI parsing code from glib
Message-ID: <jhweyusyjhha5hvffrtkwvuce35fajiy73dymgjre3jkjcjk7v@lrgdiintwb6i>
References: <20240328140607.2433889-1-thuth@redhat.com>
 <20240328140607.2433889-7-thuth@redhat.com>
 <20240328141342.GK7636@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328141342.GK7636@redhat.com>
User-Agent: NeoMutt/20240201
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jlibbBjlDHF.A.S1D.i_YBmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2782
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/jhweyusyjhha5hvffrtkwvuce35fajiy73dymgjre3jkjcjk7v@lrgdiintwb6i
Resent-Date: Thu, 28 Mar 2024 15:42:27 +0000 (UTC)

Adjusting cc list to add upstream NBD and drop developers unrelated to
this part of the qemu series...

On Thu, Mar 28, 2024 at 02:13:42PM +0000, Richard W.M. Jones wrote:
> On Thu, Mar 28, 2024 at 03:06:03PM +0100, Thomas Huth wrote:
> > Since version 2.66, glib has useful URI parsing functions, too.
> > Use those instead of the QEMU-internal ones to be finally able
> > to get rid of the latter. The g_uri_get_host() also takes care
> > of removing the square brackets from IPv6 addresses, so we can
> > drop that part of the QEMU code now, too.
> > 

> >  
> >      if (is_unix) {
> >          /* nbd+unix:///export?socket=path */
> > -        if (uri->server || uri->port || strcmp(qp->p[0].name, "socket")) {
> > +        const char *uri_socket = g_hash_table_lookup(qp, "socket");
> > +        if (uri_server || uri_port != -1 || !uri_socket) {
> >              ret = -EINVAL;
> >              goto out;
> >          }

The spec for NBD URIs is at:

https://github.com/NetworkBlockDevice/nbd/blob/master/doc/uri.md

Should any of this spec mention case-insensitive concerns, such as
whether 'NBD://' may be equivalent to 'nbd://', and whether
'nbd+unix:///?socket=x' is equivalent to 'nbd+unix:///?Socket=x'?
Right now, I think that most implementations of NBD servers and
clients happen to use case-sensitive parsing; but glib provides the
option to do case-insensitive query parsing.

If I read https://docs.gtk.org/glib/type_func.Uri.parse_params.html
correctly, passing G_URI_PARAMS_CASE_INSENSITIVE (which you did not
do) would mean that 'nbd+unix:///?socket=ignore&Socket=/for/real'
would result in this g_hash_table_lookup finding only "Socket", not
"socket".  Maybe it is worth an explicit addition to the NBD URI spec
to mention that we intend to be case-sensitive (in the parts where it
can be; I'm not sure if the schema part must be handled
case-insensitively without re-reading the RFCs), and therefore that
'Socket=' does NOT have the same meaning as 'socket='.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

