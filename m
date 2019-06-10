Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3ED3B3EA
	for <lists+nbd@lfdr.de>; Mon, 10 Jun 2019 13:20:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 47FA520336; Mon, 10 Jun 2019 11:20:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 10 11:20:02 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C94A6202D7
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Jun 2019 11:19:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3GUJvBCPcBnC for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Jun 2019 11:19:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 38A4E201FB
	for <nbd@other.debian.org>; Mon, 10 Jun 2019 11:19:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6AF95D60F;
	Mon, 10 Jun 2019 11:19:34 +0000 (UTC)
Received: from localhost (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 570175C224;
	Mon, 10 Jun 2019 11:19:33 +0000 (UTC)
Date: Mon, 10 Jun 2019 12:19:32 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: nbd@other.debian.org, w@uter.be, eblake@redhat.com, mkletzan@redhat.com
Subject: Re: [PATCH v2] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190610111932.GG3888@redhat.com>
References: <20190528103537.15081-1-rjones@redhat.com>
 <20190528103537.15081-2-rjones@redhat.com>
 <20190605171920.GB12691@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190605171920.GB12691@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 10 Jun 2019 11:19:39 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IbmZcPGSPIK.A.dAE.izj_cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/565
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190610111932.GG3888@redhat.com
Resent-Date: Mon, 10 Jun 2019 11:20:02 +0000 (UTC)

On Wed, Jun 05, 2019 at 06:19:20PM +0100, Daniel P. Berrangé wrote:
> > +* `tls-verify-peer`: This optional parameter may be `0` or `1` to
> > +  control whether the client verifies the server's identity.  By
> > +  default clients SHOULD verify the server's identity if TLS is
> > +  negotiated and if a suitable Certificate Authorty is available.
> 
> I'd prefer if this is a "MUST" for the default value to be 1, if
> omitted.

"SHOULD" here means that's what implementations ought to do, and most
will do it by default, but it leaves some leeway for implementations
which cannot or choose not to verify the peer for whatever reason
(even though we know that is unsafe in some MITM cases).  I've tried
to avoid mandating implementations except when it's absolutely
necessary.

> > +### TLS certificates directory
> > +
> > +The `tls-certificates` parameter (if used) refers to a directory
> > +containing the Certificate Authority (CA) certificates bundle, client
> > +certificate, client private key, and CA Certificate Revocation List.
> > +
> > +These are all optional except for the CA certificates bundle.
> > +
> > +The files in this directory SHOULD use the following names:
> > +
> > +    Filename               Usage
> > +    --------------------------------------------------
> > +    ca-cert.pem            CA certificates bundle
> > +    client-cert.pem        Client certificate
> > +    client-key.pem         Client private key
> > +    ca-crl.pem             CA Certificate Revocation List
> 
> QEMU suports a "dh-params.pem" file for the diffie-hellman parameters.
> 
> With PSK, it uses a "tls-creds-psk" file with optional dh-params.pem
> file too.

This is really the crux of the issue that prevents me from getting a
submitting draft.

I think there are three ways forward:

(1) Mandate the QEMU-style certificates directory, as outlined above
(with Dan's amendment).  This requires a small change to libnbd.  It
is compatible with nbd-client albeit reducing the "flexibility" os
what nbd-client allows.

(2) Add tls-* parameters for each individual file.  Requires
substantial changes to QEMU and libnbd.  Flexible but you're going to
end up with very long TLS URIs.

(3) Drop all the TLS parameters related to the certificate and key
names / paths.  It's a free-for-all until someone else decides what's
best to do.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org

