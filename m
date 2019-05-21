Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4980C258E1
	for <lists+nbd@lfdr.de>; Tue, 21 May 2019 22:31:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2938E205CA; Tue, 21 May 2019 20:31:00 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 21 20:31:00 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EE27A205C9
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 May 2019 20:30:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nZRgx-1vuB8G for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 May 2019 20:30:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A5EEF205BB
	for <nbd@other.debian.org>; Tue, 21 May 2019 20:30:48 +0000 (UTC)
Received: from [105.228.48.136] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <w@uter.be>)
	id 1hTBPJ-0005kZ-6g; Tue, 21 May 2019 22:30:45 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1hTBPA-0007e0-LX; Tue, 21 May 2019 22:30:36 +0200
Date: Tue, 21 May 2019 22:30:36 +0200
From: Wouter Verhelst <w@uter.be>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, berrange@redhat.com, eblake@redhat.com
Subject: Re: Standard NBD URL syntax (again)
Message-ID: <20190521203036.GA24332@grep.be>
References: <20190520092056.GA9368@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520092056.GA9368@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2hFtIPV8g9B.A.mSB.EAG5cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/503
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190521203036.GA24332@grep.be
Resent-Date: Tue, 21 May 2019 20:31:00 +0000 (UTC)

Hi,

On Mon, May 20, 2019 at 10:20:56AM +0100, Richard W.M. Jones wrote:
> 
> Previous discussion:
> https://lists.debian.org/nbd/2018/07/msg00002.html
> 
> Again I'm stuck because we need a URL syntax for NBD.
> 
> Various URLs have been proposed before:
> 
>   * Library      Hostname+port over TCP/IP
>                  Unix domain socket
> 		 Export name
>   - Link for further information
>   - Notes
> 
>   * libguestfs   nbd://example.com:port      (:port is optional)
>                  nbd://?socket=/socket
> 		 nbd://example.com:port/exportname
>                  nbd:///exportname?socket=/socket
>   - http://libguestfs.org/guestfish.1.html#a-nbd:-example.com-:port
>   - Cannot specify an export name without a leading '/' character
> 
>   * QEMU         nbd:example.com:port
>                  nbd:unix:/socket
> 		 nbd:example.com:port:exportname=/export
>   - https://qemu.weilnetz.de/doc/qemu-doc.html#Device-URL-Syntax
>   - Not a real URL!
> 
>   * Curl         nbd://example.com/
>                  nbd://example.com/exportname
>   - https://github.com/rwmjones/curl/commit/2aba3dd7d8f9b8e03a8c3435e7555ab9e195675a#diff-77ab3188c0ad08b7b9d8d9787c8e9d75
>   - Cannot specify an export name without a leading '/' character
>   - No Unix domain socket syntax was ever defined.
>   - Did not go upstream.

There's also dracut:

     kernel /vmlinuz-2.6.29.4-167.fc11.i686.PAE rw root=UUID=123456 netroot=nbd:192.168.0.4:2345:ext3 ip=eth0:dhcp

(from https://fedoraproject.org/wiki/QA:Testcase_Dracut_root%3Dnbd)

and the Debian initramfs-tools hooks:

nbdroot=<server>,<exportname>,<device>
nbdroot=<server>,<exportname> root=/dev/nbd0

(/usr/share/doc/nbd-client/README.Debian in the Debian nbd-client
package contains a few more examples)

these obviously aren't URLs currently, but the dracut syntax gets rather
close; and it might make sense to have a URL format that would allow
(eventually) to replace these.

> The leading problem with the "obvious" NBD URL format seems to be that
> it's impossible to specify empty export names or export names which
> don't start with a '/' character.

Not sure? We can just define the / as a separator character, rather than
as part of the name. That would then result in:

nbd://nbd-server.example.com:12345/foo

for "the export called 'foo' at nbd-server.example.com on port 12345"

nbd://nbd-server.example.com//foo

for "the export called '/foo' at nbd-server.example.com on the default
port"

Alternatively, we could URL-encode things, since the NBD spec allows way
more characters than do URLs:

nbds://nbd-server.example.com/%2Ffoo

for "the export called '/foo' at nbd-server.example.com, using STARTTLS"

That also allows to create a 

> This is why I'd be inclined to use an extra URL parameter instead,
> like:
> 
>   nbd://example.com[:port]/?export=exportname
> 
> and for Unix domain sockets:
> 
>   nbd:///?export=exportname&socket=/socket

I think I prefer the "nbd+unix" format here, that Eric suggested.

> The export would be optional, defaulting to empty string.  IPv6
> addresses would work in the obvious way for URLs, using "[...]"
> around the address part (ie as in RFC 2732).  All escaping issues
> would work as for standard URLs.

Right.

> I think we should standardize this once and for all in a document in
> the NBD repository.

+1. I have been planning to implement URL parsing in nbd-client, too;
having a standard URL format for that would definitely help.

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

