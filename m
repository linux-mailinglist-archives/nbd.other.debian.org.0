Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3506E68B5
	for <lists+nbd@lfdr.de>; Tue, 18 Apr 2023 17:54:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E16BA20ACF; Tue, 18 Apr 2023 15:54:37 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 18 15:54:37 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,LONGWORD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SARE_MSGID_LONG45,SARE_MSGID_LONG50,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 210A720764
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 Apr 2023 15:54:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.463 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, LONGWORD=2, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id alo8erm8CQop for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 Apr 2023 15:54:19 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 7D1E420A4B
	for <nbd@other.debian.org>; Tue, 18 Apr 2023 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681833252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yAOjxcSfRVR+sv1+/TJOL6TV+cw+sjGeEYX6VUSTf+g=;
	b=H+pwBgoUooiWbtHA+fEtOYp6RPmao6ilbAqhUVjuvzwBzSl/Lz+Rl9GQQuAXO+XtLX5uAU
	dvhyS4BSmifvw/G7MZoyczap3uOyYfAAiARijcizaQUZ2hzIx4AWcIg1B0BmYrHEIDcFIt
	6umybd/GlF8ht6LqxXvk+vh9Pu4OZDw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-17jWu_f0MP6Xxqw5PJptKg-1; Tue, 18 Apr 2023 11:54:10 -0400
X-MC-Unique: 17jWu_f0MP6Xxqw5PJptKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7D811C0A58C;
	Tue, 18 Apr 2023 15:54:09 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.177])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 481DE4085720;
	Tue, 18 Apr 2023 15:54:03 +0000 (UTC)
Date: Tue, 18 Apr 2023 10:54:01 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com
Subject: Re: [PATCH v3 6/6] RFC: spec: Introduce
 NBD_REPLY_TYPE_OFFSET_HOLE_EXT
Message-ID: <yy3zptjdh3xgftcxgngbfbzuw7tsayjdk42zswghf3qjkv2oub@fuiregckzf4n>
References: <20230413220241.1396012-1-eblake@redhat.com>
 <20230413220241.1396012-7-eblake@redhat.com>
 <ZD6OJXoQBNJH5p4W@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <ZD6OJXoQBNJH5p4W@pc220518.home.grep.be>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jJeKUSWEPPJ.A.4GF.90rPkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2437
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/yy3zptjdh3xgftcxgngbfbzuw7tsayjdk42zswghf3qjkv2oub@fuiregckzf4n
Resent-Date: Tue, 18 Apr 2023 15:54:37 +0000 (UTC)

On Tue, Apr 18, 2023 at 02:33:41PM +0200, Wouter Verhelst wrote:
> On Thu, Apr 13, 2023 at 05:02:41PM -0500, Eric Blake wrote:
> > Rather than requiring all servers and clients to have a 32-bit limit
> > on maximum NBD_CMD_READ/WRITE sizes, we can choose to standardize
> > support for a 64-bit single I/O transaction now.
> > NBD_REPLY_TYPE_OFFSET_DATA can already handle a large reply, but
> > NBD_REPLY_TYPE_OFFSET_HOLE needs a 64-bit counterpart.
> > 
> > By standardizing this, all clients must be prepared to support both
> > types of hole type replies, even though most server implementations of
> > extended replies are likely to only send one hole type.
> 
> I think it's probably a better idea to push this patch to a separate
> "extension-*" branch, and link to that from proto.md on master. Those
> are documented as "we standardized this, but no first implementor exists
> yet".
> 
> If someone actually comes up with a reason for 64-bit transactions, we
> can then see if the spec matches the need and merge it to master.

Okay, based on that, I'll merge this in a new branch, at which point
we WILL have something definitive to point to as a way to unjam the
patches to libnbd and qemu (they were waiting in part on having a spec
close enough to final).  I think patches 1 and 2 are ready for
mainstream, and only 3 and later need the extension branch.  I'm also
very reluctant to check patch 6 into the extension branch for now
(having it just be in the mail archives is good enough), since I have
not yet played with making qemu or libnbd support payloads larger than
64M, and am not sure if it ever makes sense to try to do an
NBD_CMD_READ or NBD_CMD_WRITE with more than 4G of material at once.
For that matter, ssize_t constraints to send() and recv() may make it
impractical to ever allow a maximum payload larger than 2G.

> 
> Otherwise this feels too much like a solution in search of a problem to
> me.

Rich has already followed up with some demonstrations of where larger
effect lengths can matter (on commands where effect length is
orthogonal to payload length).

> 
> With that said, for the things I didn't reply to, you can add:
> 
> Reviewed-By: Wouter Verhelst <w@uter.be>

I've replied to your other reviews with a couple of ideas to squash
in.  The insistence on only a 64-bit block status reply when extended
headers are in effect will have the most ripple effect on my
qemu/libnbd patches, but I don't think it is insurmountable, and agree
that insisting on extended headers mandating 64-bit responses is a bit
simpler than a client that has to handle both 32- and 64-bit responses
(a client may still need the complexity of handling both types in
order to talk to servers without extended headers, but that is a
different sort of complexity and can be phased out over time if lots
of servers decide to move towards 64-bit headers).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

